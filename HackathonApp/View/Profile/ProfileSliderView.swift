//
//  ProfileSliderView.swift
//  HackathonApp
//
//  Created by Skyeng on 09.10.2021.
//

import SwiftUI

struct ProfileSliderView: View {
    @State var value: Int

    var body: some View {
        HStack {
            ForEach(0..<7) { index in
                VStack {
                    HStack {
                        Color.black
                            .frame(width: 0.5, height: 4)
                        Spacer()
                        if index == 6 {
                            Color.black
                                .frame(width: 1, height: 4)
                        }
                    }.padding(.bottom, 5)
                    ZStack {
                        if index == 0 {
                            Color("blue_1")
                                .cornerRadius(radius: 3, corners: [.bottomLeft, .topLeft])
                        }
                        else if index == value - 1 {
                            Color("blue_1")
                                .cornerRadius(radius: 3, corners: [.bottomRight, .topRight])
                        }
                        else {
                            Color("blue_1")
                        }
                        
                        if index < value {
                            if index == 0 {
                                Color("1")
                                    .cornerRadius(radius: 3, corners: [.bottomLeft, .topLeft])
                            }
                            else if index == value - 1 {
                                Color("1")
                                    .cornerRadius(radius: 3, corners: [.bottomRight, .topRight])
                            }
                            else {
                                Color("1")
                            }
                        }
                    }.frame(height: 9)
                }
            }
            Spacer()
        }.fixedSize(horizontal: false, vertical: true)
    }
}

struct ProfileSliderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileSliderView(value: 3)
                .previewLayout(.fixed(width: 340, height: 30))
                .padding(.horizontal)
        }
    }
}
