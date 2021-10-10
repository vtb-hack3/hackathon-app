//
//  TestView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TestView: View {

    @State var text: String

    func colorForIndex(_ index: Int) -> Color {
        let color: Color
        if index == 0 {
            color = Color("blue_4")
        } else if index == 1 {
            color = Color("blue_1")
        } else {
            color = Color("blue_1")
        }
        return color
    }

    var body: some View {
        ZStack {
            Color(.white)
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(text)
                        .font(.system(size: 15, weight: .medium, design: .default))
                        .foregroundColor(Color("blue_7"))
                    
                    HStack {
                        Text("Уровень")
                            .foregroundColor(Color("blue_4"))
                            .font(.system(size: 13, weight: .regular, design: .default))
                        
                        HStack(spacing: 3) {
                            ForEach(0..<3) { index in
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(colorForIndex(index))
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
                Color("blue_1")
                Text("новичок")
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(Color("blue_8"))
            }
            .frame(width: 67, height: 24)
            .cornerRadius(6)
            .padding(EdgeInsets(top: 78, leading: 134, bottom: 12, trailing: 10)) // fix if there is better way to pin to bottom trailing
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(text: "С чего мне начать?")
            .previewLayout(.fixed(width: 211, height: 114))
    }
}
