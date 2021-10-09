//
//  QuizHeader.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizHeader: View {
    var body: some View {
        ZStack {
            Color("blue_4")
            HStack {
                HStack {
                    AnswerScoreItem(isCorrect: true)
                    AnswerScoreItem(isCorrect: false)
                    AnswerScoreItem(isCorrect: false)
                }
                Spacer()
                ZStack {
                    Image("round_bg")
                    Image("user_1")

                }

            }.padding(.horizontal)
            ZStack {
                Image("round_bg")
                Text("1")
                    .font(.title)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.923, green: 0.647, blue: -0.225)/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)

            }
            .padding()
        }
    }
}

struct QuizHeader_Previews: PreviewProvider {
    static var previews: some View {
        QuizHeader()
            .previewLayout(.fixed(width: 375, height: 191))
    }
}
