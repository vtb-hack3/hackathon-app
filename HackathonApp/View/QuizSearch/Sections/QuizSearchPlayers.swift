//
//  QuizSearchPlayers.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizSearchPlayers: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        HStack {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .strokeBorder(Color("blue_2"), lineWidth: 1)
                        .background(Circle().foregroundColor(Color("blue_1")))
                        .frame(width: 82, height: 82)
                    Image.profile(by: $userViewModel.pictureId.wrappedValue)
                }
                Text("Марк")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            Spacer()
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .strokeBorder(Color("blue_2"), lineWidth: 1)
                        .background(Circle().foregroundColor(Color("blue_1")))
                        .frame(width: 82, height: 82)
                    Text("?")
                        .font(.system(size: 35))
                }

                Text("Игрок")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
        }
        .padding()
    }
}

struct QuizSearchPlayers_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultPlayers()
            .environmentObject(UserViewModel())
    }
}
