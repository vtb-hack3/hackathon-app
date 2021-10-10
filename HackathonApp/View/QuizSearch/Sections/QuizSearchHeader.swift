//
//  QuizSearchHeader.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizSearchHeader: View {
    var body: some View {
        ZStack {
            Color("blue_5")
            VStack {
                Spacer()
                Text("VS")
                    .font(.system(size: 42))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .cornerRadius(radius: 34, corners: [.bottomLeft, .bottomRight])
    }
}

struct QuizSearchHeader_Previews: PreviewProvider {
    static var previews: some View {
        QuizSearchHeader()
    }
}
