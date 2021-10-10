//
//  CreateUserResponse.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import Foundation

struct CreateUserResponse: Codable {
    let message: User
}

// MARK: - Message
struct User: Codable {
    let id: Int? = nil
    let name: String
    let status: String? = nil
    let pictureId: Int
    let coins: Int? = nil 

    enum CodingKeys: String, CodingKey {
        case id, name, status
        case pictureId = "picture_id"
        case coins
    }
}
