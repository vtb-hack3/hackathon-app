//
//  MentorView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct MentorView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Твой наставник")
                    .font(.system(size: 17, weight: .medium, design: .default))
                Spacer() 
            }
//            .padding(.leading, 20)
            
            MentorBannerView()
                .frame(height: 107)
//                .border(Color("blue_4"), width: 1)
                .cornerRadius(16)
        }
        .padding()
    }
}

struct MentorView_Previews: PreviewProvider {
    static var previews: some View {
        MentorView()
            .previewDevice(.init(rawValue: "iPhone 13"))
    }
}
