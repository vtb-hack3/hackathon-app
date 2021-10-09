//
//  AnswersView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct Answers {
    enum `Type` {
        case list
        case puzzle
    }
    let answers: [Answer]
    let type: Type
    let rivalAnswerIndex: Int?
}

struct AnswersView: View {
    @State var answers: Answers

    var body: some View {
        ScrollView {
            Spacer(minLength: 40)
            if answers.type == .puzzle {
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        AnswerItemView(answer: answers.answers[0])
                        AnswerItemView(answer: answers.answers[1])
                    }
                    HStack(spacing: 16) {
                        AnswerItemView(answer: answers.answers[2])
                        AnswerItemView(answer: answers.answers[3])
                    }
                }
            }
            else {
                VStack(spacing: 16) {
                    ForEach(0..<answers.answers.count, id: \.self) { index in
                        AnswerItemView(answer: answers.answers[index])
                    }

                }
            }
        }
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView(
            answers: .init(answers: answersMock, type: .list, rivalAnswerIndex: nil)
        )

        AnswersView(
            answers: .init(answers: answersMock, type: .puzzle, rivalAnswerIndex: 1)
        )
    }
}