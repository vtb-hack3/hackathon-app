//
//  TutorialBookRow.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TutorialBookRow: View {
    struct Model {
        let textColor: Color
        let bgColor: Color
        let text: String
        let image: Image
    }

    @State var model: Model

    var body: some View {
        ZStack {
            model.bgColor
            VStack(alignment: .leading) {
                Text(model.text)
                    .foregroundColor(model.textColor)
                    .lineLimit(100)
                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 0, trailing: 4))
                    .font(.system(size: 13))
                model.image
                    .resizable()
                    .frame(width: 45, height: 45)
                    .shadow(color: .init("blue_8"), radius: 56, x: 0, y: 0)
            }
        }
    }
}

struct TutorialBookRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialBookRow(
            model: .init(
                textColor: .white,
                bgColor: Color("blue_9"),
                text: "Биткоин и все о нем",
                image: Image("BitcoinImage")
            )
        )
    }
}
