//
//  MainQuizView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct MainQuizView: View {
    var body: some View {
        ZStack {
            Color(.white)
            Image("img_enviro")
                .resizable()
                .scaledToFit()
            VStack {
                HeaderSectionView()
                    .padding()
                
                ZStack {
                    HStack {
                        Text("Начинающий")
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                            
                        Image("MedalImage")
                            .resizable()
                            .frame(width: 48, height: 39)
                    }
                    .frame(width: 339, height: 64)
                    .background(Color("blue_1"))
                    .cornerRadius(20)
                }
                .padding(.bottom, 72)
                Spacer()
                Text("Начать викторину")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 19))
                .frame(width: 343, height: 64)
                .background(Color("blue_5"))
                .cornerRadius(16)
                .shadow(color: Color("shadow_2"), radius: 18, x: 0, y: 0)
                Spacer()
                    .frame(height: 24)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct MainQuizView_Previews: PreviewProvider {
    static var previews: some View {
        MainQuizView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
