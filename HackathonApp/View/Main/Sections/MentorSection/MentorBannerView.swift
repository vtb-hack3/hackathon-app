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
            
            HStack(spacing: 0) {
                VStack {
                    Spacer()
                    Image("MentorImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 97, height: 81)
                        .padding(.leading, 16)
                }
                
                VStack {
                    MessageBubbleView(bubbleState: .incoming, text: "Привет, я Макс!")
                    MessageBubbleView(bubbleState: .outcoming, text: "Привет!")
                        .padding(.leading, 100)
                }
                .shadow(color: Color("shadow_1"), radius: 20, x: 0, y: 0)
            }
        }
    }
}

struct MentorBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MentorBannerView()
            .previewLayout(.fixed(width: 343, height: 107))
    }
}
