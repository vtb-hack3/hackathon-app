//
//  QuizView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct Quiz: Decodable {
    let id: Int
    let text: String
    let answers: [Answer]
}

struct QuizView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        ZStack {
            VStack {
                QuizHeader()
                    .frame(height: 191)
                    .cornerRadius(radius: 35, corners: [.bottomRight, .bottomLeft])
                    .ignoresSafeArea(edges: .top)
                QuestionView(question: $viewModel.quiz.wrappedValue?.text ?? "")
                    .cornerRadius(16)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                    .shadow(color: .black.opacity(0.3), radius: 16, x: 0, y: 10)
                AnswersView(
                    answers: .init(
                        answers: viewModel.quiz!.answers,
                        type: viewModel.quiz!.answers.count == 4 ? .puzzle : .list
                    )
                )
                    .environmentObject(viewModel)
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
