//
//  QuizHeader.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizHeader: View {
    var body: some View {
        ZStack {
            Color("blue_4")
            HStack {
                Text("Викторина")
                    .fontWeight(.medium)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                    Image("NotificationImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
        }
    }
}

struct QuizHeader_Previews: PreviewProvider {
    static var previews: some View {
        QuizHeader()
            .previewLayout(.fixed(width: 375, height: 191))
    }
}
