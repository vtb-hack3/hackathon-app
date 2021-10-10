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
}

struct AnswersView: View {
    @State var answers: Answers
    @EnvironmentObject var quizViewModel: QuizViewModel
    
    var body: some View {
        ScrollView {
            Spacer(minLength: 40)
            if answers.type == .puzzle {
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        AnswerItemView(answer: answers.answers[0])
                            .onTapGesture {
                                if quizViewModel.selectedAnswers.count > 0 {
                                    $quizViewModel.selectedAnswers.wrappedValue.removeLast()
                                    quizViewModel.selectedAnswers.append(answers.answers[0])
                                }
                            }
                        AnswerItemView(answer: answers.answers[1])
                            .onTapGesture {
                                if quizViewModel.selectedAnswers.count > 0 {
                                    $quizViewModel.selectedAnswers.wrappedValue.removeLast()
                                    quizViewModel.selectedAnswers.append(answers.answers[1])
                                }
                            }
                    }
                    HStack(spacing: 16) {
                        AnswerItemView(answer: answers.answers[2])
                            .onTapGesture {
                                if quizViewModel.selectedAnswers.count > 0 {
                                    $quizViewModel.selectedAnswers.wrappedValue.removeLast()
                                    quizViewModel.selectedAnswers.append(answers.answers[2])
                                }
                            }
                        AnswerItemView(answer: answers.answers[3])
                            .onTapGesture {
                                if quizViewModel.selectedAnswers.count > 0 {
                                    $quizViewModel.selectedAnswers.wrappedValue.removeLast()
                                    quizViewModel.selectedAnswers.append(answers.answers[3])
                                }
                            }
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
            answers: .init(
                answers: [
                    .init(
                        id: 1,
                        text: "Answer",
                        is_right: true,
                        description: "Great"
                    ),
                    .init(
                        id: 2,
                        text: "Answer2",
                        is_right: false,
                        description: ":("
                    )
                ], type: .list
            )
        )
            .environmentObject(QuizViewModel())

        AnswersView(
            answers: .init(answers: .init(
                [
                    .init(
                        id: 1,
                        text: "Answer",
                        is_right: true,
                        description: "Great"
                    ),
                    .init(
                        id: 2,
                        text: "Answer2",
                        is_right: false,
                        description: ":("
                    )
                ]
            ), type: .puzzle
                          )
        )
            .environmentObject(QuizViewModel())
    }
}
