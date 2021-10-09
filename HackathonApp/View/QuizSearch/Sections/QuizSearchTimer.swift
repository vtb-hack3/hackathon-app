//
//  QuizSearchTimer.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct QuizSearchTimer: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            Text("Поиск игрока")
                .font(.system(size: 17))
                .fontWeight(.regular)
                .foregroundColor(.white)
            Text("\($viewModel.matchmakingSeconds.wrappedValue ?? 0)")
                .font(.system(size: 52))
                .fontWeight(.bold)
                .foregroundColor(Color("blue_6"))
                .padding()
                .background(Color("blue_1"))
                .cornerRadius(32)
        }
    }
}

struct QuizSearchTimer_Previews: PreviewProvider {
    static var previews: some View {
        QuizSearchTimer()
            .environmentObject(QuizViewModel())
    }
}
