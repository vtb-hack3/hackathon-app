//
//  HeaderSectionView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct HeaderSectionView: View {
    var body: some View {
        HStack {
            Image("CharacterImage")
                .resizable()
                .frame(width: 44, height: 44)
            Spacer()
            
            ZStack {
                HStack {
                    Image("CoinImage")
                        .resizable()
                        .frame(width: 30, height: 28)
                    Text("250")
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
    }
}
