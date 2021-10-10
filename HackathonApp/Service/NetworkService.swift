//
//  NetworkService.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import Foundation

class NetworkService {
    private var baseUrl = "https://api.vtb-hack.ru/"
    
    func searchGame(userId: Int, completionHandler: @escaping (Game) -> ()) {
        guard let url = URL(string: baseUrl + "game/room/\(userId)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                let game = try! JSONDecoder().decode(Game.self, from: data)
                completionHandler(game)
            }
        }.resume()
    }
    
    func createUser(name: String, pictureId: Int, coins: Int, completion: @escaping (CreateUserResponse) -> ()) {
        guard let url = URL(string: baseUrl + "user/create/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parametrs: [String: Any] = [
            "name": name,
            "picture_id": pictureId,
            "coins": coins
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametrs, options: .prettyPrinted)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                let response = try! JSONDecoder().decode(CreateUserResponse.self, from: data)
                completion(response)
            }
        }.resume()
    }
    
    func passAnswer(userId: Int, answerId: Int, questionId: Int, roomId: Int) {
        guard let url = URL(string: baseUrl + "game/room/\(roomId)/answer/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parametrs: [String: Any] = [
            "user_id": userId,
            "question_id": questionId,
            "answer_id": answerId,
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametrs, options: .prettyPrinted)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8))
        }.resume()
    }
    
    func getTotalAnswers(userId: Int, roomId: Int, completion: @escaping (TotalAnswersResponse) -> ()) {
        guard let url = URL(string: baseUrl + "game/room/\(roomId)/total_answers/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parametrs: [String: Any] = [
            "user_id": userId,
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parametrs, options: .prettyPrinted)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                let response = try! JSONDecoder().decode(TotalAnswersResponse.self, from: data)
                completion(response)
            }
        }.resume()
    }
}
