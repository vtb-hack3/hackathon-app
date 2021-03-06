//
//  ChatView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        
        VStack(alignment: .trailing) {
            VStack(alignment: .leading) {
                // Navigation bar
                HStack {
                    Text("Знакомство")
                        .font(.system(size: 28, weight: .medium, design: .default))
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 42, height: 42)
                            .foregroundColor(Color("blue_1"))
                        Image("BurgerImage")
                            .resizable()
                            .frame(width: 17, height: 12)
                    }
                }
                .padding()
                
                // Message feed
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<11) { index in
                        if index.isMultiple(of: 2) {
                            HStack(alignment: .bottom, spacing: 8) {
                                ZStack {
                                    Circle()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(Color("blue_7"))
                                    Image("StarImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22, height: 22)
                                }
                                TextMessageView(bubbleState: .incoming, text: "Привет! Я Макс, буду твоим наставником и помогу с инвестициями. Я буду иногда давать тебе задания, а за каждое правильно выполненное буду начислять баллы.")
                            }
                        } else {
                            HStack {
                                Spacer()
                                TextMessageView(bubbleState: .outcoming, text: "Круто! А что за задания?")
                            }
                        }
                    }
                }
                .padding()
            }

            // Chips view
            MessageSuggestionChipsList()
                .padding(.trailing)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
