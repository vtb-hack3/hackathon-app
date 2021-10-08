//
//  ContentView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 08.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image("ic_home")
                    Text("Главная")
                }
            QuizView()
                .tabItem {
                    Image("ic_quiz")
                    Text("Викторина")
                }
            ProfileView()
                .tabItem {
                    Image("ic_profile")
                    Text("Профиль")
                }
        }
        .accentColor(Color("blue_60"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
