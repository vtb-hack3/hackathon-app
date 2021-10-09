//
//  AnswerScoreItem.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct AnswerScoreItem: View {
    @State var isCorrect: Bool

    var body: some View {
        Image(isCorrect ? "answer_true" : "answer_false")
            .frame(width: 32, height: 32)
    }
}

struct AnswerScoreItem_Previews: PreviewProvider {
    static var previews: some View {
        AnswerScoreItem(isCorrect: true)
            .previewLayout(.sizeThatFits)
        AnswerScoreItem(isCorrect: false)
            .previewLayout(.sizeThatFits)
    }
}
