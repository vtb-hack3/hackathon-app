//
//  MessageSuggestionChip.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct MessageSuggestionChip: View {
    @State var text: String
    var body: some View {
        Text(text)
            .fontWeight(.regular)
            .font(.system(size: 15))
            .foregroundColor(Color("blue_4"))
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color("blue_4"), lineWidth: 1)
            )
    }
}

struct MessageSuggestionChip_Previews: PreviewProvider {
    static var previews: some View {
        MessageSuggestionChip(text: "Готов приступить к обучению")
    }
}
