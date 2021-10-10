//
//  Game.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    let message: Message
}

// MARK: - Message
struct Message: Codable {
    let room: Room
}

// MARK: - Room
struct Room: Codable {
    let id: Int
    let questions: [Quiz]
    let creator, opponent: Creator
    let startedAt: String
    let finishedAt: String
    let isJoinable: Bool

    enum CodingKeys: String, CodingKey {
        case id, questions, creator, opponent
        case startedAt = "started_at"
        case finishedAt = "finished_at"
        case isJoinable = "is_joinable"
    }
}

// MARK: - Creator
struct Creator: Codable {
    let id: Int
    let name, status: String
    let pictureID, coins: Int

    enum CodingKeys: String, CodingKey {
        case id, name, status
        case pictureID = "picture_id"
        case coins
    }
}

//// MARK: - GameQuestion
//struct GameQuestion: Codable {
//    let id: Int
//    let answers: [Answer]
//    let text: String
//}

// MARK: - GameAnswer
//struct GameAnswer: Codable {
//    let id: Int
//    let text: String
//    let isRight: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, text
//        case isRight = "is_right"
//    }
//}

