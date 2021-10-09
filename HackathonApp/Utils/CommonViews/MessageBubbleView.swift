//
//  MessageBubbleView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

enum MessageBubbleViewState {
    case incoming // will be positioned on leading edge
    case outcoming // will be positioned on trailing edge
}

struct MessageBubbleView: View {
    @State var bubbleState: MessageBubbleViewState
    var text: String
    
    var body: some View {
        Text(text)
            .padding(10)
            .background(bubbleState == .incoming ? Color("blue_4") : .white)
            .foregroundColor(bubbleState == .incoming ? .white : .black)
            .cornerRadius(radius: 15, corners: bubbleState == .incoming ? [.topRight, .topLeft, .bottomRight] : [.topRight, .topLeft, .bottomLeft])
        
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleView(bubbleState: .incoming, text: "месседж бабл экзампл едрить мадрить и еще какой нибудь текст")
    }
}
