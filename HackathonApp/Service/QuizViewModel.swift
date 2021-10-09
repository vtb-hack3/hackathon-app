import Foundation
import Combine

fileprivate let userId = Int32.random(in: Int32.min...Int32.max)

final class QuizViewModel: ObservableObject {

    @Published var question: Question?
    @Published var questionProgressSec: Int?
    @Published var opponent: Opponent?
    @Published var myAnswerIndex: Int?
    @Published var opponentAnswerIndex: Int?
    @Published var matchmakingSeconds: Int?
    @Published var finished: Bool = false
    @Published var isConnected: Bool = false

    private var questions: [Question] = []
    private var currentQuestionIndex: Int = 0

    let webSocketService = WebSocketService()

    private var msgCancellable: AnyCancellable?
    private var connectionCancellable: AnyCancellable?

    init() {
        msgCancellable = webSocketService.$messages.sink { [weak self] messages in
            guard let self = self,
                  let message = messages.last else {
                      return
                  }
            switch message.type {
            case .quizStarted:
                self.questions = message.payload.questions!
                self.opponent = message.payload.opponent!
                self.question = self.questions[0]
            case .opponentAnswered:
                self.opponentAnswerIndex = message.payload.answerId!
            case .timerTick:
                if let questionProgressSec = message.payload.questionProgress {
                    self.questionProgressSec = questionProgressSec
                } else if let matchmakingSeconds = message.payload.matchmakingProgress {
                    self.matchmakingSeconds = matchmakingSeconds
                }
            case .nextQuestion:
                self.resetQuestionStats()
                break
            case .finish:
                self.finished = true
                self.resetQuestionStats()
                self.msgCancellable?.cancel()
            }
        }
        connectionCancellable = webSocketService.$isConnected.sink { [weak self] isConnected in
            self?.isConnected = isConnected
        }
    }

    func startMatchmaking() {
        webSocketService.connect()
        webSocketService.send(
            message: .init(
                type: .startQuiz,
                payload: .init(
                    userId: Int(userId),
                    answerId: nil,
                    questionId: nil
                )
            )
        )
    }

    func cancelMatchmaking() {
        webSocketService.send(
            message: .init(
                type: .leave,
                payload: .init(
                    userId: nil,
                    answerId: nil,
                    questionId: nil
                )
            )
        )
        msgCancellable?.cancel()
        connectionCancellable?.cancel()
    }

    func answer(answerId: Int) {
        myAnswerIndex = answerId
        webSocketService.send(
            message: OutgoingMessage(
                type: .answer,
                payload: .init(
                    userId: nil,
                    answerId: answerId,
                    questionId: currentQuestionIndex
                )
            )
        )
    }

    func leave() {
        resetQuestionStats()
        msgCancellable?.cancel()
        connectionCancellable?.cancel()
        webSocketService.send(
            message: OutgoingMessage(
                type: .leave,
                payload: .init(
                    userId: nil,
                    answerId: nil,
                    questionId: nil
                )
            )
        )
    }

    private func resetQuestionStats() {
        self.opponentAnswerIndex = nil
        self.myAnswerIndex = nil
        self.questionProgressSec = nil
        self.question = nil
    }

    private func nextQuestion() {
        currentQuestionIndex += 1
        question = questions[currentQuestionIndex]
    }

    deinit {
        msgCancellable?.cancel()
        connectionCancellable?.cancel()
    }
}
