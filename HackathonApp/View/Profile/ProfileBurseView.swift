//
//  ProfileBurseView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct ProfileBurseView: View {
    var body: some View {
        ZStack {
            Color("blue_2")
            VStack(spacing: 26) {
                Text("Биржа")
                    .font(.title)
                    .fontWeight(.medium)
                HStack(spacing: 8) {
                    createItemView(title: "20 % скидка  на акции ВТБ", image: "burse_item_1")
                    createItemView(title: "20 % скидка  на акции ВТБ", image: "burse_item_2")
                }.fixedSize(horizontal: false, vertical: true)
                HStack(spacing: 8) {
                    createItemView(title: "20 % скидка  на акции ВТБ", image: "burse_item_3")
                    createItemView(title: "20 % скидка  на акции ВТБ", image: "burse_item_3")
                }.fixedSize(horizontal: false, vertical: true)
            }
            .padding(.init(top: 20, leading: 12, bottom: 14, trailing: 12))
        }
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
    }

    private func createItemView(
        title: String,
        image: String
    ) -> some View {
        ZStack {
            Color.white
            VStack(spacing: 12) {
                Text(title)
                Image(image)

                Button(action: {
                    //                            self.selectedPoster = nil
                }) {
                    ZStack {
                        Color("1")
                        Text("Купить")
                            .foregroundColor(Color.white)
                    }
                    .cornerRadius(16)
                }
                .padding(.init(top: 14, leading: 13, bottom: 10, trailing: 13))
                .frame(height: 33 + 14 + 10)
            }
            .padding(.top, 10)
        }.cornerRadius(20)
    }
}

struct ProfileBurseView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBurseView()
    }
}
