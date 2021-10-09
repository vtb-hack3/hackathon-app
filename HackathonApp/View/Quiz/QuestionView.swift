//
//  QuestionView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct QuestionView: View {
    let question: String

    var body: some View {
        ZStack {
            Color.white
            VStack {
                ZStack {
                    Color("blue_4")
                        .cornerRadius(radius: 16, corners: [.bottomLeft, .bottomRight])
                    Text("Инвестиции")
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 6, leading: 24, bottom: 10, trailing: 24))
                }.fixedSize()
                    .padding(.bottom, 20)
                Text(question)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: quizMock.question)
            .previewDevice("iPhone 13")
    }
}
