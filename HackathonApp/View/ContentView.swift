//
//  ContentView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 08.10.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel = UserViewModel()
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image("ic_home")
                    Text("Главная")
                }
            MainQuizView()
                .tabItem {
                    Image("ic_quiz")
                    Text("Викторина")
                }
                .environmentObject(userViewModel)
            ProfileView()
                .tabItem {
                    Image("ic_profile")
                    Text("Профиль")
                }
                .environmentObject(userViewModel)
        }
        .accentColor(Color("blue_5"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
