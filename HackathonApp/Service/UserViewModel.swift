import Combine
import Foundation
import UIKit

final class UserViewModel {
    @Published var name: String = "User"
    @Published var pictureId: Int = 0
    @Published private(set) var rankPoints: Int = 0
    @Published private(set) var rank: Rank = .newbie
    @Published var coins: Int = 250

    enum Rank {
        case newbie
        case expirienced
        case expert
    }

    func setRankPoints(_ points: Int) {
        rankPoints = points
    }

    func addRankPoints(_ points: Int) {
        rankPoints += points
    }

    func addCoins(_ coins: Int) {
        self.coins += coins
    }

    private func refreshRank() {
        switch rankPoints {
        case ...2499:
            rank = .newbie
        case 2500..<5000:
            rank = .expirienced
        case 5000...:
            rank = .expert
        default:
            break
        }
    }
}
