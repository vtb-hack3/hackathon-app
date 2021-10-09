//
//  ProfileItemView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct ProfileItemView: View {
    let imageName: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 12) {
            Image(imageName)
            HStack {
                Text(title + ":")
                Text(subtitle)
                    .foregroundColor(Color("blue_7"))
            }
            Spacer()
        }
    }
}

struct ProfileItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItemView(imageName: "status_item", title: "Мой уровень", subtitle: "Новичок")
    }
}
