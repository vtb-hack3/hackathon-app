import Foundation
import Combine

fileprivate let userId = Int32.random(in: Int32.min...Int32.max)

let localQuizzes: [Quiz] = [
    .init(
        id: 0,
        text: "Начнем с азов. В чем основная проблема и угроза активных инвестиций в акции?",
        answers: [
            .init(
                id: 0,
                text: "Нужно тратить время на изучение акций и управление портфелем: постоянно обновлять анализ, следить за новостями и проводить ребалансировку",
                is_right: true,
                description: "На рынке идет жесткая борьба за каждый процент - и, чтобы получать доходность выше, чем по биржевым фондам, придется подробно изучать, как все устроено. Но и этого может не хватить."
            ),
            .init(
                id: 1,
                text: "На рынке много профессиональных конкурентов, которые вкладывают деньги, чтобы получить эксклюзивную информацию о компания. И большинство все равно показывает доходностьниже рынка",
                is_right: false,
                description: "Нет, не совсем."
            ),
            .init(
                id: 2,
                text: "Нужно тратить время на изучение акций и управление портфелем",
                is_right: false,
                description: "Ну нет, это слишком."
            )
        ]
    ),
    .init(
        id: 0,
        text: "Начнем с азов. В чем основная проблема и угроза активных инвестиций в акции?",
        answers: [
            .init(
                id: 0,
                text: "Нужно тратить время на изучение акций и управление портфелем: постоянно обновлять анализ, следить за новостями и проводить ребалансировку",
                is_right: true,
                description: "На рынке идет жесткая борьба за каждый процент - и, чтобы получать доходность выше, чем по биржевым фондам, придется подробно изучать, как все устроено. Но и этого может не хватить."
            ),
            .init(
                id: 1,
                text: "На рынке много профессиональных конкурентов, которые вкладывают деньги, чтобы получить эксклюзивную информацию о компания. И большинство все равно показывает доходностьниже рынка",
                is_right: false,
                description: "Нет, не совсем."
            ),
            .init(
                id: 2,
                text: "Нужно тратить время на изучение акций и управление портфелем",
                is_right: false,
                description: "Ну нет, это слишком."
            )
        ]
    ),
    .init(
        id: 0,
        text: "Начнем с азов. В чем основная проблема и угроза активных инвестиций в акции?",
        answers: [
            .init(
                id: 0,
                text: "Нужно тратить время на изучение акций и управление портфелем: постоянно обновлять анализ, следить за новостями и проводить ребалансировку",
                is_right: true,
                description: "На рынке идет жесткая борьба за каждый процент - и, чтобы получать доходность выше, чем по биржевым фондам, придется подробно изучать, как все устроено. Но и этого может не хватить."
            ),
            .init(
                id: 1,
                text: "На рынке много профессиональных конкурентов, которые вкладывают деньги, чтобы получить эксклюзивную информацию о компания. И большинство все равно показывает доходностьниже рынка",
                is_right: false,
                description: "Нет, не совсем."
            ),
            .init(
                id: 2,
                text: "Нужно тратить время на изучение акций и управление портфелем",
                is_right: false,
                description: "Ну нет, это слишком."
            )
        ]
    )
]

final class QuizViewModel: ObservableObject {

    @Published var quiz: Quiz? = localQuizzes[0]
    @Published var questionProgressSec: Int?
    @Published var pauseSec: Int?
    @Published var opponent: Opponent?
    @Published var myAnswerIndex: Int?
    @Published var opponentAnswerIndex: Int?
    @Published var matchmakingSeconds: Int?
    @Published var finished: Bool = false
    @Published var isConnected: Bool = false

    private var quizzes: [Quiz] = []
    private var currentQuizIndex: Int = 0

    private var botService: BotService?

    private var isLocal: Bool { botService != nil }

    private var gameTimer: Timer?
    private var pauseTimer: Timer?

    func getOpponent(rank: UserViewModel.Rank) -> Opponent {
        if let opponent = opponent {
            return opponent
        } else {
            let botService = BotService(rank: rank)
            self.botService = botService
            let opponent = Opponent(name: botService.name, pictureId: botService.imageId)
            self.opponent = opponent
            self.quizzes = localQuizzes
            self.quiz = localQuizzes[0]
            self.currentQuizIndex = 0
            self.questionProgressSec = 0
            return opponent
        }
    }

    func beginGame() {
        if isLocal {
            beginGameTimer()
        }
    }

    private func beginGameTimer() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if let questionProgressSec = self.questionProgressSec {
                if questionProgressSec < 15 {
                    self.questionProgressSec = questionProgressSec + 1
                } else {
                    self.questionProgressSec = 0
                    self.gameTimer?.invalidate()
                    self.gameTimer = nil
                    self.pauseBetweenQuizes()
                }
            }
        }
    }

    private func pauseBetweenQuizes() {
        if isLocal {
            pauseTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] timer in
                guard let self = self else { return }
                if let pauseSec = self.pauseSec {
                    if pauseSec < 3 {
                        self.pauseSec = pauseSec + 1
                    } else {
                        self.pauseSec = nil
                        self.pauseTimer?.invalidate()
                        self.beginGameTimer()
                    }
                }
            }
        }
    }

    func cancelMatchmaking() {
    }

    func answer(answerId: Int) {
    }

    func leave() {
    }

    private func resetQuestionStats() {
        self.opponentAnswerIndex = nil
        self.myAnswerIndex = nil
        self.questionProgressSec = nil
        self.quiz = nil
        self.botService = nil
        self.opponent = nil
        self.gameTimer?.invalidate()
        self.gameTimer = nil
        self.pauseTimer?.invalidate()
        self.pauseTimer = nil
    }

    private func nextQuestion() {
        currentQuizIndex += 1
        quiz = quizzes[currentQuizIndex]
    }

    deinit {
        resetQuestionStats()
    }
}
