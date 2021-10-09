struct OutgoingMessage: Encodable {
    let type: MessageType
    let payload: Payload

    enum MessageType: String, Encodable {
        case startQuiz
        case answer
        case leave
    }

    struct Payload: Encodable {
        let userId: Int?
        let answerId: Int?
        let questionId: Int?
    }
}
