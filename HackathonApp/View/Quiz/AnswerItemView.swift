//
//  AnswersView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct Answer: Codable {
    let id: Int
    var text: String
    var is_right: Bool
    let description: String?
}

struct AnswerItemView: View {
    @State var answer: Answer
    @State var didAnswer: Bool = false
    @State var isShowRivalSelect: Bool = false

    var body: some View {
        ZStack {
            ZStack {
                ZStack {
                    Color(
                        didAnswer ?  ($answer.is_right.wrappedValue ? "corect_answer" : "incorect_answer") : "blue_1"
                    )
                    Text($answer.text.wrappedValue)
                        .padding(EdgeInsets(top: 14, leading: 12, bottom: 14, trailing: 12))
                }
                .onTapGesture {
                    self.didAnswer = true
                }
            }
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("red"), lineWidth: isShowRivalSelect ? 2 : 0)
            ).padding(.horizontal)

            if isShowRivalSelect {
                VStack {
                    HStack(alignment: .top) {
                        Spacer()
                        ZStack {
                            Image("round_bg")
                            Image("user_1")
                        }
                        .overlay(Circle().stroke(Color("red"), lineWidth: 2))
                    }
                    Spacer()
                }
                .offset(y: -30)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct AnswerItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerItemView(
            answer: .init(
                id: 0,
                text: "Answer",
                is_right: true,
                description: "Great"
            )
        )
    }
}
