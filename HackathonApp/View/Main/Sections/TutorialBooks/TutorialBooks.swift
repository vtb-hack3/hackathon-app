//
//  TutorialBooks.swift
//  HackathonApp
//
//  Created by Максим Алексеев  on 09.10.2021.
//

import SwiftUI

struct TutorialBooks: View {
    var body: some View {
        VStack {
            HStack {
                Text("Учебники")
                    .font(.system(size: 17))
                Spacer()
                Button("Смотреть все") {
                    
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        TutorialBookRow()
                            .frame(width: 117, height: 112, alignment: .leading)
                            .cornerRadius(16)
                    }
                }
            }
        }
        .padding()
    }
}

struct TutorialBooks_Previews: PreviewProvider {
    static var previews: some View {
        TutorialBooks()
    }
}
