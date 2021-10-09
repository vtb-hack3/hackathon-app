//
//  TaskMessageAnswerOptionView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TaskMessageAnswerOptionView: View {
    var text: String
    @State var isChosen: Bool
    var body: some View {
        HStack {
            ZStack {
                if isChosen {
                    Circle()
                        .foregroundColor(Color("blue_4"))
                        .frame(width: 10, height: 10)
                }
                
                Circle()
                    .strokeBorder(Color("blue_4"), lineWidth: 1)
                    .foregroundColor(Color("blue_4"))
                    .frame(width: 16, height: 16)
            }
                
            Text(text)
        }
        .onTapGesture {
            isChosen.toggle()
        }
    }
}

struct TaskMessageAnswerOptionView_Previews: PreviewProvider {
    static var previews: some View {
        TaskMessageAnswerOptionView(text: "Возраст", isChosen: true)
    }
}
