//
//  TextMessageView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TextMessageView: View {
    @State var bubbleState: MessageBubbleViewState
    var text: String
    
    var body: some View {
        Text(text)
            .padding(10)
            .background(bubbleState == .incoming ? Color("blue_4") : Color("blue_1"))
            .foregroundColor(bubbleState == .incoming ? .white : .black)
            .cornerRadius(radius: 15, corners: bubbleState == .incoming ? [.topRight, .topLeft, .bottomRight] : [.topRight, .topLeft, .bottomLeft])
        
    }
}

struct TextMessageView_Previews: PreviewProvider {
    static var previews: some View {
        TextMessageView(bubbleState: .incoming, text: "месседж бабл экзампл едрить мадрить и еще какой нибудь текст")
    }
}
