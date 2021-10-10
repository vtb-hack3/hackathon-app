//
//  AdviceView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct AdviceView: View {
    let isCorrect: Bool = false
    let advice: String

    var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        //                            self.selectedPoster = nil
                    }) {
                        Image("close")
                    }
                }
                HStack {
                    Color(isCorrect ? "green_2" : "red")
                        .frame(width: 2)
                    VStack(alignment: .leading, spacing: 16.0) {
                        Text(isCorrect ? "Верно" : "Неверно")
                            .foregroundColor(
                                Color(isCorrect ? "green_2" : "red")
                            )
                        Text(advice)
                    }
                }.padding(.bottom, 30)
                Button(action: {
                    //                            self.selectedPoster = nil
                }) {
                    ZStack {
                        Color("blue_5")
                        Text("Продолжить")
                            .foregroundColor(Color.white)
                    }.cornerRadius(16)
                }
                .padding(.horizontal)
                .frame(height: 58)
            }
            .padding(.bottom)
        }
            .cornerRadius(16)
            .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdviceView(advice: "quizMock.advice")
        }
    }
}
