//
//  QuizView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct Quiz: Codable {
    let id: Int
    let text: String
    let answers: [Answer]
}

struct QuizView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var quizViewModel: QuizViewModel

    @State var progressValue: Float = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                QuizHeader(userPictureId: $userViewModel.pictureId.wrappedValue)
                    .frame(height: 191)
                    .cornerRadius(radius: 35, corners: [.bottomRight, .bottomLeft])
                    .ignoresSafeArea(edges: .top)
                if $quizViewModel.pauseSec.wrappedValue == nil {
                    QuestionView(question: $quizViewModel.quiz.wrappedValue?.text ?? "")
                        .cornerRadius(16)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                        .shadow(color: .black.opacity(0.3), radius: 16, x: 0, y: 10)
                    AnswersView()
                        .environmentObject(quizViewModel)
                    ProgressBar(
                        value: .constant(
                            Float(
                                $quizViewModel.questionProgressSec.wrappedValue ?? 0
                            ) / 15.0
                        )
                    )
                        .frame(height: 14)
                        .padding()
                } else {
                    Spacer()
                    ProgressView()
                        .padding()
                    Text("Ожидаем оппонента...")
                        .font(.system(size: 25))
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(progressValue: 0.5)
            .environmentObject(QuizViewModel())
            .environmentObject(UserViewModel())
    }
}

struct ProgressBar: View {
    @Binding var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color("blue_2"))

                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color("blue_5"))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}
