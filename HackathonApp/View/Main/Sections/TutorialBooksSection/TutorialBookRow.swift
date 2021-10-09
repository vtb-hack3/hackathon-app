//
//  TutorialBookRow.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TutorialBookRow: View {
    var body: some View {
        ZStack {
            Color("blue_9")
            VStack(alignment: .leading) {
                Text("Биткоин и все о нем")
                    .foregroundColor(.white)
                    .lineLimit(100)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                    .font(.system(size: 13))
                Image("BitcoinImage")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .shadow(color: .init("blue_8"), radius: 56, x: 0, y: 0)
            }
        }
    }
}

struct TutorialBookRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialBookRow()
    }
}
