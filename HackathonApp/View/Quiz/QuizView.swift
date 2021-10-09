//
//  QuizView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct Quiz {
    let question: String
    let answers: [Answer]
    let advice: String
    let rivalAnswerIndex: Int?
}

struct QuizView: View {
    let quiz: Quiz
    
    var body: some View {
        ZStack {
            VStack {
                QuizHeader()
                    .frame(height: 191)
                    .cornerRadius(radius: 35, corners: [.bottomRight, .bottomLeft])
                    .ignoresSafeArea(edges: .top)
                QuestionView(question: quiz.question)
                    .cornerRadius(16)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                    .shadow(color: .black.opacity(0.3), radius: 16, x: 0, y: 10)
                AnswersView(
                    answers: .init(
                        answers: quiz.answers,
                        type: quiz.answers.count == 4 ? .puzzle : .list,
                        rivalAnswerIndex: quiz.rivalAnswerIndex
                    )
                )
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quiz: quizMock)
    }
}

let quizMock: Quiz = .init(
    question: "Начнем с азов.   В чем основная проблема и угроза активных инвестиций   в акции?",
    answers: answersMock,
    advice: "На рынке идет жесткая борьба  за каждый процент - и, чтобы получать доходность выше, чем по биржевым фондам, придется подробно изучать,  как все устроено. Но и этого  может не хватить.",
    rivalAnswerIndex: nil
)

let answersMock: [Answer] = [
    .init(
        answer: "Нужно тратить время на изучение акций и управление портфелем: постоянно обновлять анализ, следить за новостями и проводить ребалансировку",
        isCorrect: true
    ),
    .init(
        answer: "На рынке много профессиональных конкурентов, которые вкладывают деньги, чтобы получить эксклюзивную информацию  о компаниях.  И большинство все равно показывает доходностьниже рынка",
        isCorrect: false
    ),
    .init(
        answer: "Нужно тратить время на изучение акций и управление п",
        isCorrect: true
    )
]
