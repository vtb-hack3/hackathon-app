//
//  BotService.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import Foundation
import Combine

class BotService: ObservableObject {
    @Published var answers: [Answer] = []
    @Published var name: String = ""
    @Published var imageName: String = ""
    
    private var botNames = ["Марк", "Илья", "Максим", "Саша"]
    private var botImageNames = ["pr_pic_0", "pr_pic_1", "pr_pic_2", "pr_pic_3",]
    
    private var rank: UserViewModel.Rank = .newbie
    private var timeToThink: Int = 0
    private var answeredCount: Int = 0 // to understand how many correct answers bot still can choose
    
    init(rank: UserViewModel.Rank) {
        self.rank = rank
        self.name = botNames.randomElement() ?? botNames[0]
        self.imageName = botImageNames.randomElement() ?? botImageNames[0]
    }
    
    func answerQuestion(options: [Answer]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(timeToThink)) {
            let randomIncorrect = options.filter { $0.isCorrect == false }.randomElement() ?? options[0]
            let correct = options.first { $0.isCorrect } ?? options[0]
            
            switch self.rank {
            case .newbie:
                self.answers.append(self.answeredCount > 0 ? randomIncorrect : correct)
            case .expert:
                self.answers.append(correct)
            case .expirienced:
                self.answers.append(self.answeredCount > 1 ? randomIncorrect : correct)
            }
        }
    }
}
