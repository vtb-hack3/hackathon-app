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

    @Published var quiz: Quiz? //
    @Published var questionProgressSec: Int? //
    @Published var opponent: User? //
    @Published var myAnswerIndex: Int?
    @Published var opponentAnswerIndex: Int?
    @Published var matchmakingSeconds: Int?
    @Published var finished: Bool = false
    @Published var isConnected: Bool = false

    private var quizzes: [Quiz] = [] //
    private var currentQuizIndex: Int = 0

    private var botService: BotService?
    private var networkService: NetworkService = NetworkService()

    func getOpponent(rank: UserViewModel.Rank) -> User {
        if let opponent = opponent {
            return opponent
        } else {
            let botService = BotService(rank: rank)
            self.botService = botService
            let opponent = User(name: botService.name, pictureId: botService.imageId)
            self.opponent = opponent
            self.quizzes = localQuizzes
            self.quiz = localQuizzes[0]
            self.currentQuizIndex = 0
            return opponent
        }
    }

    func startMatchmaking() {
        let id = UserDefaults.standard.integer(forKey: "userId")
        networkService.searchGame(userId: id) { game in
//            opponent?.name = game.message.room.opponent.name
//            opponent?.pictureId = game.message.room.opponent.pictureId
//            game.message.room
        }
    }

    func cancelMatchmaking() {
    }

    func answer(answerId: Int) {
    }

    func leave() {
    }

    
    func nextQuestion() {
        currentQuizIndex += 1
        quiz = quizzes[currentQuizIndex]
    }
    
    private func resetQuestionStats() {
        self.opponentAnswerIndex = nil
        self.myAnswerIndex = nil
        self.questionProgressSec = nil
        self.quiz = nil
        self.botService = nil
        self.opponent = nil
    }
}
