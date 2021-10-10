//
//  QuizHeader.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizHeader: View {
    @State var userPictureId: Int
    @State var firstAnswerCorrect: Bool = false
    @State var secondAnswerCorrect: Bool = false
    @State var thirdAnswerCorrect: Bool = false

    var body: some View {
        ZStack {
            Color("blue_4")
            HStack {
                ZStack {
                    Image.profile(by: userPictureId)
                }
                Spacer()
                HStack {
                    AnswerScoreItem(isCorrect: firstAnswerCorrect)
                    AnswerScoreItem(isCorrect: secondAnswerCorrect)
                    AnswerScoreItem(isCorrect: thirdAnswerCorrect)
                }

            }.padding(.horizontal)

        }
    }
}

struct QuizHeader_Previews: PreviewProvider {
    static var previews: some View {
        QuizHeader(userPictureId: 0)
            .previewLayout(.fixed(width: 375, height: 191))
    }
}
