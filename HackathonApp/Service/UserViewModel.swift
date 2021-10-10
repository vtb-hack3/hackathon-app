import Combine
import Foundation

final class UserViewModel: ObservableObject {
    @Published var name: String = "User"
    @Published var pictureId: Int = 0
    @Published var rankPoints: Int = 0
    @Published var rank: Rank = .expirienced
    @Published var coins: Int = 600
    @Published var isFirstLauch: Bool

    init(isFirstLauch: Bool = true) {
        self.isFirstLauch = isFirstLauch
    }

    enum Rank {
        case newbie
        case expirienced
        case expert
    }

    func setRankPoints(_ points: Int) {
        rankPoints = points
        refreshRank()
    }

    func addRankPoints(_ points: Int) {
        rankPoints += points
        UserDefaults.standard.set(rankPoints, forKey: "rankPoints")
        refreshRank()
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

import SwiftUI

extension Image {
    static func profile(by id: Int) -> Image {
        switch id {
        case 0:
            return Image("pr_pic_0")
        case 1:
            return Image("pr_pic_1")
        case 2:
            return Image("pr_pic_2")
        case 3:
            return Image("pr_pic_3")
        default:
            return Image("pr_pic_0")
        }
    }
}

extension String {
    static func imageName(from rank: UserViewModel.Rank) -> String {
        switch rank {
        case .newbie:
            return "level"
        case .expirienced:
            return "level_2"
        case .expert:
            return "level_3"
        }
    }
}

extension String {
    static func rank(from rank: UserViewModel.Rank) -> String {
        switch rank {
        case .newbie:
            return "Новичок"
        case .expirienced:
            return "Опытный"
        case .expert:
            return "Знаток"
        }
    }
}
