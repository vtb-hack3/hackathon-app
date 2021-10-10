//
//  QuizSearchView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizSearchView: View {

    @EnvironmentObject var viewModel: QuizViewModel

    var body: some View {
        ZStack {
            Color(.white)
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
            .environmentObject(viewModel)
        }
    }
}

struct QuizSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuizSearchView()
    }
}
