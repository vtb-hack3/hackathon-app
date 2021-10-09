//
//  HeaderSectionView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct HeaderSectionView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        HStack {
            ZStack {
                Color("blue_3")
                    .clipShape(Circle())
                Image.profile(by: $userViewModel.pictureId.wrappedValue)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("1"), lineWidth: 2))
            }
            .frame(width: 44, height: 44)
            Spacer()
            
            ZStack {
                HStack {
                    Image("CoinImage")
                        .resizable()
                        .frame(width: 30, height: 28)
                    Text("\(userViewModel.coins)")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(.white)

                }
                .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
            }
            .background(Color("blue_5"))
            .cornerRadius(26)
        }
    }
}

struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSectionView()
            .environmentObject(UserViewModel.init())
    }
}
