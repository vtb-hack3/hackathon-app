//
//  QuizView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        VStack {
            QuizHeader()
                .frame(height: 191)
            .cornerRadius(radius: 35, corners: [.bottomRight, .bottomLeft])
            .ignoresSafeArea(edges: .top)
            Spacer()
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
