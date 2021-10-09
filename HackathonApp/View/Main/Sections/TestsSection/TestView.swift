//
//  TestView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Color("blue_5")
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("С чего мне начать?")
                        .font(.system(size: 15, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Уровень")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular, design: .default))
                        
                        HStack(spacing: 3) {
                            ForEach(0..<3) { index in
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor( index == 0 ? .white : Color("blue_3"))
                            }
                        }
                    }
                    .padding(.top, 12)
                    Spacer()
                }
                .offset(x: 10, y: 10)
                Spacer() 
            }
            
            ZStack {
                Color.white
                Text("новичок")
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(Color("blue_5"))
            }
            .frame(width: 67, height: 24)
            .cornerRadius(6)
            .padding(EdgeInsets(top: 78, leading: 134, bottom: 12, trailing: 10)) // fix if there is better way to pin to bottom trailing
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .previewLayout(.fixed(width: 211, height: 114))
    }
}
