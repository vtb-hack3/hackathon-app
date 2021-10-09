//
//  TutorialBooks.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TutorialBooks: View {

    @State var tutorialModels: [TutorialBookRow.Model] = [
        .init(
            textColor: .white,
            bgColor: Color("blue_9"),
            text: "Биткоин и все о нем",
            image: Image("BitcoinImage")
        ),
        .init(
            textColor: .black,
            bgColor: Color("blue_1"),
            text: "Первые шаги на бирже",
            image: Image("a8a319b8cdf20d891e15b0ffa3f52859 1")
        ),
        .init(
            textColor: .white,
            bgColor: Color("blue_4"),
            text: "Облигации: как заработать?",
            image: Image("a103287bebc7f81486dc49b58b3b1c3e 1")
        )
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Учебники")
                    .font(.system(size: 19))
                Spacer()
                Button("Смотреть все") {
                    
                }
                
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tutorialModels.indices) { index in
                        TutorialBookRow(model: self.tutorialModels[index])
                            .frame(width: 135, height: 130, alignment: .leading)
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TutorialBooks_Previews: PreviewProvider {
    static var previews: some View {
        TutorialBooks()
    }
}
