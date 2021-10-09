//
//  QuizResultPlayers .swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizResultPlayers: View {
    var body: some View {
        HStack {
            VStack(spacing: 8) {
                Circle()
                    .strokeBorder(Color("orange_border"), lineWidth: 1)
                    .background(Circle().foregroundColor(Color("blue_9")))
                    .frame(width: 82, height: 82)
                Text("Марк")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(spacing: 8) {
                Circle()
                    .strokeBorder(Color("orange_border"), lineWidth: 1)
                    .background(Circle().foregroundColor(Color("blue_9")))
                    .frame(width: 82, height: 82)
                    
                Text("Игрок")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

struct QuizResultPlayers_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultPlayers()
    }
}
