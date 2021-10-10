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
        case selectManyAnswers
    }
    
    var question: String
    var answers: [String]
    var description: String = ""
    var state: AnswerLayoutState
    var imageName: String
}

struct OnboardingView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    let onboardingModels: [OnboardingModel]
    @State var modelIndex: Int = 0
    @State var openNextScreen: Bool = false
    @State var openNameScreen: Bool = false
    @State var answersSelectIndexes: [Int] = []

    var body: some View {
        ZStack {
            Color("blue_1")
            VStack {

                if onboardingModels[modelIndex].description != "" {
                    VStack(spacing: 12) {
                        Text(onboardingModels[modelIndex].question)
                            .font(.title2)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        Text(onboardingModels[modelIndex].description)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 42)
                    .padding(.top, 50)
                }
                else {
                    Text(onboardingModels[modelIndex].question)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 42)
                        .padding(.top, 50)
                }

                switch onboardingModels[modelIndex].state {
                case .twoAnswers:
                    HStack {
                        ForEach(onboardingModels[modelIndex].answers, id: \.self) { answer in
                            Text(answer)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(Color("blue_7"))
                                .frame(width: 167, height: 52)
                                .background(.white)
                                .cornerRadius(12)
                                .onTapGesture {
                                    if modelIndex == onboardingModels.count - 1 {
                                        // userViewModel.coins += 500
                                        openNextScreen.toggle()
                                    } else {
                                        modelIndex += 1
                                    }
                                }
                        }
                    }
                case .threeAnswers:
                    ForEach(onboardingModels[modelIndex].answers, id: \.self) { answer in
                        Text(answer)
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(Color("blue_7"))
                            .frame(width: 343   , height: 52)
                            .background(.white)
                            .cornerRadius(12)
                            .padding(.bottom, 24)
                            .onTapGesture {
                                if modelIndex == onboardingModels.count - 1 {
                                    // userViewModel.coins += 500
                                    openNameScreen.toggle()
                                } else {
                                    modelIndex += 1
                                }
                            }
                    }
                case .selectManyAnswers:
                    ForEach(0..<onboardingModels[modelIndex].answers.count, id: \.self) { index in
                        ZStack {
                            Color.white
                            HStack(alignment: .center, spacing: 12) {
                                ZStack {
                                    Color.white
                                        .frame(width: 16, height: 16)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color("1"), lineWidth: 1))
                                    Color("1")
                                        .opacity(answersSelectIndexes.contains(index) ? 1 : 0)
                                        .frame(width: 10, height: 10)
                                        .clipShape(Circle())
                                }
                                Text(onboardingModels[modelIndex].answers[index])
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("blue_7"))
                                    .onTapGesture {
                                        if let removeIndex =  answersSelectIndexes.firstIndex(where: { $0 == index }) {
                                            answersSelectIndexes.remove(at: removeIndex)
                                        }
                                        else {
                                            answersSelectIndexes.append(index)
                                        }
                                    }
                                Spacer()
                            }.padding()
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .cornerRadius(12)
                        .padding(.bottom, 24)
                    }
                }

                Spacer()

                if onboardingModels[modelIndex].state != .selectManyAnswers {
                    Image(onboardingModels[modelIndex].imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 235, height: 300)
                } else if answersSelectIndexes.count > 0 {
                    Text("Продолжить")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 343, height: 52)
                        .background(Color("blue_5"))
                        .cornerRadius(12)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            openNameScreen.toggle()
                        }
                }
            }
            .padding()
        }
        .ignoresSafeArea()
        .navigate(
            to: OnbordingSpendingView()
                .environmentObject(userViewModel),
            when: $openNextScreen
        )
        .navigate(
            to: OnboardingNameView()
                .environmentObject(userViewModel),
            when: $openNameScreen
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingModels: mockOnboardingData)
    }
}

let mockOnboardingData: [OnboardingModel] = [
    OnboardingModel(question: "Выберите цель, которую хотите достичь", answers: ["Изучить основы финансов", "Научиться предсказывать тренды", "Стать экспертом в торговле CFD"], description: "Выберите несколько вариантов ответов или пропустите вопрос", state: .threeAnswers, imageName: "onboarding_1"),
    OnboardingModel(question: "Вы новичок в инвестициях?", answers: ["Да", "Нет"], state: .twoAnswers, imageName: "onboarding_1"),
]


extension View {
    func navigate<NewView: View>(
        to view: NewView,
        when binding: Binding<Bool>
    ) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}
