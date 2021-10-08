import SwiftUI

struct GreetingsHeaderView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Color("blue_2")
                    .cornerRadius(radius: 35, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea(edges: .top)
                VStack(spacing: 2) {
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        Text("Добро пожаловать")
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        Text("Марк!")
                            .font(.system(size: 28))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        CircleProgressBar()
                            .shadow(color: .white, radius: 30)
                        Spacer()
                            .frame(width: 24)
                    }
                }
            }
        }
    }
}

struct GreetingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingsHeaderView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}