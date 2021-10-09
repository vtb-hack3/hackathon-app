//
//  ProfileHeaderView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State var levelImage: String
    @State var level: String
    @State var coins: Int


    var body: some View {
        ZStack {
            Color("1")
            HStack {
                VStack {
                    ZStack {
                        Color("blue_3")
                        Text(level)
                            .foregroundColor(.white)
                            .padding(10)

                    }
                    .cornerRadius(26)
                    .frame(width: 130, height: 41)
                    Image(levelImage)
                        .offset(y: -75)
                        .padding(.bottom, -75)
                }
                Spacer()
                VStack {
                    ZStack {
                        Color("blue_3")
                        Text("\(coins)")
                            .foregroundColor(.white)
                            .padding(10)

                    }
                    .cornerRadius(26)
                    .frame(width: 130, height: 41)
                    Image("coin")
                        .offset(y: -75)
                        .padding(.bottom, -75)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(
            levelImage: "level",
            level: "Уровень",
            coins: 250
        )
            .previewLayout(.fixed(width: 375, height: 191))
    }
}
