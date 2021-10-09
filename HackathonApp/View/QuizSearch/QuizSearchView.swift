//
//  QuizSearchView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizSearchView: View {
    var body: some View {
        ZStack {
            Color("blue_7")
            VStack {
                QuizSearchHeader()
                    .frame(height: 191)
                    .ignoresSafeArea(edges: .top)
                QuizSearchPlayers()
                    .offset(x: 0, y: -120)
                    .padding(.bottom, -120)
                QuizSearchTimer()
                Image("QuizSearchImage")
                    .resizable()
                    .frame(width: 375, height: 357)
                    .scaledToFit()
                Spacer()
            }
        }
    }
}

struct QuizSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuizSearchView()
    }
}
