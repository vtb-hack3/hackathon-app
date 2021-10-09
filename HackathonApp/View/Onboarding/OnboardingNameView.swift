//
//  OnboardingNameView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 10.10.2021.
//

import SwiftUI

struct OnboardingNameView: View {
    @State var name: String = ""
    @State var selectedIndex: Int = 0
    var body: some View {
        ZStack {
            Color("blue_1")
            // Text field
            VStack {
                VStack(alignment: .leading) {
                    Text("Как тебя зовут?")
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                        .foregroundColor(Color("gray_2"))
                    TextField("Иван Иванов Иванович", text: $name)
                        .frame(width: 343, height: 44)
                        .padding(.leading, 10)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color("blue_3"))
                        )
                    
                }
                .padding(.bottom, 32)
                .padding(.top, 40)
                
                // User
                VStack(alignment: .leading) {
                    Text("Выберите аватарку")
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                        .foregroundColor(Color("gray_2"))
                    
                    HStack(spacing: 20) {
                        ForEach(0..<4) { index in
                            ZStack {
                                Circle()
                                    .strokeBorder(selectedIndex == index ? Color("blue_3") : .white)
                                    .frame(width: 70, height: 70)
                                
                                Image("pr_pic_\(index)")
                                    .resizable()
                                    .frame(width: 58, height: 60)
                            }
                            .onTapGesture {
                                selectedIndex = index
                            }
                        }
                    }
                }
                Spacer()
                
                if name.count > 0 {
                    Text("Продолжить")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 343, height: 52)
                        .background(Color("blue_5"))
                        .cornerRadius(12)
                        .padding(.bottom, 30)
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct OnboardingNameView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNameView()
    }
}
