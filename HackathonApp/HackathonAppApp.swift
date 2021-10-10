//
//  HackathonAppApp.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 08.10.2021.
//

import SwiftUI

@main
struct HackathonAppApp: App {
    @StateObject private var userViewModel = UserViewModel(isFirstLauch: UserDefaults.isFirstLauch)
    
    var body: some Scene {
        WindowGroup {
            if userViewModel.isFirstLauch == true {
                OnboardingView(onboardingModels: mockOnboardingData)
                    .environmentObject(userViewModel)
            }
            else {
                ContentView()
                    .environmentObject(userViewModel)
            }
        }
    }
}

extension UserDefaults {
    static private let key: String = "isFirstLauchKey"

    static var isFirstLauch: Bool {
        get {
            return UserDefaults.standard.value(forKey: UserDefaults.key) as? Bool ?? true
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.key)
        }
    }
}
