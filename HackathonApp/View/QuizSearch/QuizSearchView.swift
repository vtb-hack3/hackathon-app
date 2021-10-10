//
//  QuizSearchView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizSearchView: View {

    @EnvironmentObject var viewModel: QuizViewModel
    @EnvironmentObject var userViewModel: UserViewModel

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color(.white)
            Image("QuizSearchImage")
                .resizable()
                .scaledToFit()
                .offset(x: 0, y: 190)
            VStack {
                QuizSearchHeader()
                    .frame(height: 191)
                    .ignoresSafeArea(edges: .top)
                QuizSearchPlayers()
                    .offset(x: 0, y: -70)
                    .padding(.bottom, -100)
                    .environmentObject(userViewModel)
                QuizSearchTimer()
                Text("Поиск игрока")
                    .foregroundColor(Color("blue_9"))
                    .font(.system(size: 20))
                Spacer()
                Button(action: cancel) {
                    ZStack {
                        Color("blue_5")
                        Text("Отмена")
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 50)
                .cornerRadius(16)
                .padding()
                Spacer()
                    .frame(height: 24)
            }
            .environmentObject(viewModel)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }

    private func cancel() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct QuizSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuizSearchView()
            .environmentObject(QuizViewModel())
            .environmentObject(UserViewModel())
    }
}
