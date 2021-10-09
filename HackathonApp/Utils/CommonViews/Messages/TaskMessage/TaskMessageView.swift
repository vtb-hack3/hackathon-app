//
//  TaskMessageView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TaskMessageView: View {
    var messageData: TaskMessageData
    @State var chosenVariantIndex: Int?
    var body: some View {
        VStack(alignment: .leading) {
            Text("Задание")
                .fontWeight(.medium)
                .font(.system(size: 17))
            
            Text(messageData.questionText)
                .fontWeight(.regular)
                .font(.system(size: 15))
                .padding(.top, 10)
                .padding(.bottom, 15)
                .fixedSize(horizontal: false, vertical: true)
                
            ForEach(messageData.answerVariants, id: \.self) { answerVariant in
                TaskMessageAnswerOptionView(text: answerVariant, isChosen: false)
                    .onTapGesture {
                        chosenVariantIndex = messageData.answerVariants.firstIndex(of: answerVariant)
                    }
            }
            
            GeometryReader { geo in
                Text("Ответить")
                    .foregroundColor(.white)
                    .frame(width: geo.size.width, height: 42)
                    .background(Color("blue_4"))
                    .cornerRadius(12)
            }
        }
        .padding()
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("blue_3"), lineWidth: 1)
        )
    }
}

struct TaskMessageView_Previews: PreviewProvider {
    static var previews: some View {
        TaskMessageView(messageData:
                            TaskMessageData(questionText: "От какого фактора в меньшей степени зависит выбор инвестиционной стратегии?",
                                            answerVariants: ["Возраст", "Срок инвестирования", "Сумма инвестирования", "Толерантность к риску"],
                                            correctVariantIndex: 2), chosenVariantIndex: nil)
            .previewLayout(.fixed(width: 279, height: 322))
    }
}
