//
//  TotalAnswersResponse.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import Foundation

struct TotalAnswersResponse: Codable {
    let message: TotalAnswersMessage
}

struct TotalAnswersMessage: Codable {
    let totalAnswers: Int
    enum CodingKeys: String, CodingKey {
        case totalAnswers = "total_answers"
    }
}
