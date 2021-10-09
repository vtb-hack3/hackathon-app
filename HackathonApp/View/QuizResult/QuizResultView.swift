//
//  QuizResultView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizResultView: View {
    var body: some View {
        ZStack {
            Color("blue_7")
                .ignoresSafeArea()
            VStack {
                QuizResultHeader()
                    .frame(height: 191)
                    .ignoresSafeArea(edges: .top)
                QuizResultPlayers()
                    .offset(x: 0, y: -120)
                Spacer()
            }
        }
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
    }
}
