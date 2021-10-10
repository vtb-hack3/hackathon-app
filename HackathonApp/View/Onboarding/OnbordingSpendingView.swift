//
//  OnbordingSpendingView.swift
//  HackathonApp
//
//  Created by Skyeng on 10.10.2021.
//

import SwiftUI

struct OnbordingSpendingView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    @State private var celsius: CGFloat = 10
    @State var openNextScreen: Bool = false

    var body: some View {
        ZStack {
            Color("blue_1")
            VStack {
                VStack(spacing: 12) {
                    Text("Какую часть доходов Вы тратите?")
                        .font(.title2)
                    Text("В среднем за последние 12 месяцев.")
                        .fontWeight(.regular)
                }
                .padding(.bottom, 52)
                VStack(spacing: 30) {
                    Text("\(celsius, specifier: "%.0f")%")
                        .font(.title)
                    CustomSlider(value: $celsius, range: 1...100)
                }
                Spacer()
                Text("Продолжить")
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 343, height: 52)
                    .background(Color("blue_5"))
                    .cornerRadius(12)
                    .padding(.bottom, 30)
                    .onTapGesture {
                        userViewModel.addRankPoints(60 * (100 - Int(celsius)))
                        openNextScreen.toggle()
                    }
            }
            .padding(.top, 70)
            .padding()
        }
        .ignoresSafeArea()
        .navigate(
            to: OnboardingView(
                onboardingModels: [
                    OnboardingModel(
                        question: "Как хорошо Вы разбираетесь \n в финансовы ранках?",
                        answers: [
                            "Получил экономическое образование",
                            "Прошел специализированные курсы в сфере финансового рынка",
                            "Получил международный аттестат"
                        ],
                        description: "Выберите несколько вариантов ответов или пропустите вопрос",
                        state: .selectManyAnswers,
                        imageName: "")
                ]
            )
                .environmentObject(userViewModel),
            when: $openNextScreen
        )
    }
}

struct OnbordingSpendingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingSpendingView()
            .environmentObject(UserViewModel())
    }
}

extension CGFloat {
    func map(from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        let result = ((self - from.lowerBound) / (from.upperBound - from.lowerBound)) * (to.upperBound - to.lowerBound) + to.lowerBound
        return result
    }
}

struct CustomSlider: View {

    @Binding var value: CGFloat

    @State var lastOffset: CGFloat = 0

    var range: ClosedRange<CGFloat>
    var leadingOffset: CGFloat = 5
    var trailingOffset: CGFloat = 5

    var knobSize: CGSize = CGSize(width: 25, height: 25)

    let trackGradient = LinearGradient(gradient: Gradient(colors: [.pink, .yellow]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 2) {
                    ForEach(0..<7) { _ in
                        RoundedRectangle(cornerRadius: 30)
                            .frame(height: 15)
                            .foregroundColor(Color("blue_2"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.clear)
                                    .shadow(color: .black, radius: 5)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                            )
                    }
                }
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: self.knobSize.width, height: self.knobSize.height)
                        .foregroundColor(Color("1"))
                        .offset(x: self.$value.wrappedValue.map(from: self.range, to: self.leadingOffset...(geometry.size.width - self.knobSize.width - self.trailingOffset)))
                        .shadow(radius: 8)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in

                                    if abs(value.translation.width) < 0.1 {
                                        self.lastOffset = self.$value.wrappedValue.map(from: self.range, to: self.leadingOffset...(geometry.size.width - self.knobSize.width - self.trailingOffset))
                                    }

                                    let sliderPos = max(0 + self.leadingOffset, min(self.lastOffset + value.translation.width, geometry.size.width - self.knobSize.width - self.trailingOffset))
                                    let sliderVal = sliderPos.map(from: self.leadingOffset...(geometry.size.width - self.knobSize.width - self.trailingOffset), to: self.range)

                                    self.value = sliderVal
                                }

                    )
                    Spacer()
                }
            }
        }
    }
}
