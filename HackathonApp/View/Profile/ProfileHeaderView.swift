//
//  ProfileHeaderView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            Color("1")
            HStack {
                VStack {
                    ZStack {
                        Color("blue_3")
                        Text(String.rank(from: userViewModel.rank))
                            .foregroundColor(.white)
                            .padding(10)

                    }
                    .cornerRadius(26)
                    .frame(width: 130, height: 41)
                    Image(.imageName(from: userViewModel.rank))
                        .offset(y: -78)
                        .padding(.bottom, -77)
                }
                Spacer()
                VStack {
                    ZStack {
                        Color("blue_3")
                        Text("\(userViewModel.coins)")
                            .foregroundColor(.white)
                            .padding(10)

                    }
                    .cornerRadius(26)
                    .frame(width: 130, height: 41)
                    Image("coin")
                        .offset(y: -78)
                        .padding(.bottom, -75)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .environmentObject(UserViewModel.init())
            .previewLayout(.fixed(width: 375, height: 191))
    }
}
