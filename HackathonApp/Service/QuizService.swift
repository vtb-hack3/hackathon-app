import Foundation
import Combine

fileprivate let userId = Int32.random(in: Int32.min...Int32.max)

final class QuizViewModel: ObservableObject {

    @Published private(set) var question: Question?
    @Published private(set) var questionProgressSec: Int?
    @Published private(set) var opponent: Opponent?
    @Published private(set) var myAnswerIndex: Int?
    @Published private(set) var opponentAnswerIndex: Int?
    @Published private(set) var matchmakingSeconds: Int?
    @Published private(set) var finished: Bool = false

    private var questions: [Question] = []
    private var currentQuestionIndex: Int = 0

    let webSocketService = WebSocketService()

    private var cancellable: AnyCancellable?

    init() {
        cancellable = webSocketService.$messages.sink { [weak self] messages in
            guard let self = self else { return }
            let message = messages.last!
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
                self.cancellable?.cancel()
            }
        }
    }

    func startMatchmaking() {
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
        cancellable?.cancel()
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
        cancellable?.cancel()
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
        cancellable?.cancel()
    }
}