struct IncomingMessage: Decodable {
    let type: MessageType
    let payload: Payload

    enum MessageType: String, Decodable {
        case quizStarted
        case opponentAnswered
        case timerTick
        case nextQuestion
        case finish
    }

    struct Payload: Decodable {
        let opponent: Opponent?
        let questions: [Question]?
        let questionId: Int?
        let answerId: Int?
        let questionProgress: Int?
        let matchmakingProgress: Int?
    }
}

struct Question: Decodable {
    let question: String
    let answers: [String]
    let correctAnswer: Int
}

struct Opponent: Decodable {
    var name: String
    var pictureId: Int
}
