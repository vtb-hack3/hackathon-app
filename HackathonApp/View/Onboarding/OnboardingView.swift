//
//  OnboardingView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import SwiftUI

struct OnboardingModel {
    enum AnswerLayoutState {
        case twoAnswers
        case threeAnswers
    }
    
    var question: String
    var answers: [String]
    var state: AnswerLayoutState
    var imageName: String
}

struct OnboardingView: View {
    let onboardingModels: [OnboardingModel]
    @State var modelIndex: Int = 0
    var body: some View {
        ZStack {
            Color("blue_1")
            VStack {
                Text(onboardingModels[modelIndex].question)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 72)
                    .padding(.top, 50)
                
                switch onboardingModels[modelIndex].state {
                case .twoAnswers:
                    HStack {
                        ForEach(onboardingModels[modelIndex].answers, id: \.self) { answer in
                            Text(answer)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .frame(width: 167, height: 52)
                                .background(Color("blue_5"))
                                .cornerRadius(12)
                                .onTapGesture {
                                    modelIndex += 1
                                }
                        }
                    }
                case .threeAnswers:
                    ForEach(onboardingModels[modelIndex].answers, id: \.self) { answer in
                        Text(answer)
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: 343   , height: 52)
                            .background(Color("blue_5"))
                            .cornerRadius(12)
                            .padding(.bottom, 24)
                            .onTapGesture {
                                modelIndex += 1
                            }
                    }
                    
                }
                
                Spacer()
                
                Image(onboardingModels[modelIndex].imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 235, height: 300)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingModels: mockOnboardingData)
    }
}

let mockOnboardingData: [OnboardingModel] = [
    OnboardingModel(question: "Выберите цель, которую хотите достичь", answers: ["Изучить основы финансов", "Научиться предсказывать тренды", "Стать экспертом в торговле CFD"], state: .threeAnswers, imageName: "onboarding_1"),
    OnboardingModel(question: "Вы новичок в инвестициях?", answers: ["Да", "Нет"], state: .twoAnswers, imageName: "onboarding_1"),
]


