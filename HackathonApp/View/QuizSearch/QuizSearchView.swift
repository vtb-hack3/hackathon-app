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
    @State var openNextScreen: Bool = false

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var seconds = 10

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: QuizAboutToStartView(
                    opponent: viewModel.getOpponent(rank: userViewModel.rank),
                    myPictureId: userViewModel.pictureId,
                    myName: userViewModel.name
                )
                                .environmentObject(userViewModel)
                                .environmentObject(viewModel),
                               isActive: $openNextScreen
                ) { EmptyView() }
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
                        QuizSearchTimer(seconds: $seconds)
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
                .onReceive(timer) { input in
                    viewModel.startMatchmaking()
                    if seconds > 0 {
                        seconds -= 1
                    } else  {
                        timer.upstream.connect().cancel()
                        openNextScreen = true
                    }
                }
            }
        }
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
