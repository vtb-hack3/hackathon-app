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
    @EnvironmentObject var quizViewModel: QuizViewModel

    var body: some View {
        ScrollView {
            Spacer(minLength: 40)
            if $quizViewModel.quiz.wrappedValue!.answers.count == 4 {
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        AnswerItemView(answer: $quizViewModel.quiz.wrappedValue!.answers[0])
                        AnswerItemView(answer: $quizViewModel.quiz.wrappedValue!.answers[1])
                    }
                    HStack(spacing: 16) {
                        AnswerItemView(answer: $quizViewModel.quiz.wrappedValue!.answers[2])
                        AnswerItemView(answer: $quizViewModel.quiz.wrappedValue!.answers[3])
                    }
                }
            }
            else {
                VStack(spacing: 16) {
                    ForEach(0..<$quizViewModel.quiz.wrappedValue!.answers.count, id: \.self) { index in
                        AnswerItemView(answer: $quizViewModel.quiz.wrappedValue!.answers[index])
                    }

                }
            }
        }
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView()
            .environmentObject(QuizViewModel())

        AnswersView()

            .environmentObject(QuizViewModel())
    }
}
