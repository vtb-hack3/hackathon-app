//
//  MentorBannerView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct MentorBannerView: View {
    var body: some View {
        ZStack {
            Color("blue_1")
                    Image("open_broker")
                        .resizable()
                        .scaledToFit()
//                        .frame(width: 97, height: 81)
//                        .padding(.leading, 16)
        }
    }
}

struct MentorBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MentorBannerView()
            .previewLayout(.fixed(width: 343, height: 107))
    }
}
