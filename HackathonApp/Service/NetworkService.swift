//
//  NetworkService.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import Foundation

class NetworkService {
    private var baseUrl = "https://socket.vtb-hack.ru/game/room/"
    func searchGame(with userId: Int, completionHandler: @escaping (Game) -> ()) {
        guard let url = URL(string: baseUrl + "\(userId)") else { return }
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
}
