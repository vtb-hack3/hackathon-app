//
//  TestListView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TestListView: View {

    @State var textViewTests: [String] = [
        "С чего мне начать?",
        "Какой я инвестор"
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Тесты")
                    .font(.system(size: 17, weight: .medium, design: .default))
                Spacer()
                Button("Смотреть все") {
                    
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(textViewTests.indices) { index in
                        TestView(text: textViewTests[index])
                            .frame(width: 230, height: 120)
                            .cornerRadius(16)
                            .padding(.vertical)
                            .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 0)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TestListView_Previews: PreviewProvider {
    static var previews: some View {
        TestListView()
    }
}
