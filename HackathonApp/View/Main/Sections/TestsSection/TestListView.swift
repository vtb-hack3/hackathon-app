//
//  TestListView.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TestListView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Тесты")
                    .font(.system(size: 17, weight: .medium, design: .default))
                Spacer()
                Button("Смотреть все") {
                    
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        TestView()
                            .frame(width: 211, height: 114)
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TestListView_Previews: PreviewProvider {
    static var previews: some View {
        TestListView()
    }
}
