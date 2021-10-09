//
//  QuizResultHeader.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizResultHeader: View {
    var body: some View {
        ZStack {
            Color("blue_6")
            VStack {
                Spacer()
                Text("1-0")
                    .font(.system(size: 36))
                    .fontWeight(.medium)
                .foregroundColor(.white)
                .padding()
            }
        }
        .cornerRadius(radius: 34, corners: [.bottomLeft, .bottomRight])
    }
}

struct QuizResultHeader_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultHeader()
            .previewLayout(.fixed(width: 375, height: 191))
    }
}
