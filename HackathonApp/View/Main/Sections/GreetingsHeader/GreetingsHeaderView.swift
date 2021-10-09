import SwiftUI

struct GreetingsHeaderView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Color("blue_5")
                    .cornerRadius(radius: 35, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea(edges: .top)
                VStack(spacing: 2) {
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        Text("Добро пожаловать")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                    }
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        Text("Марк!")
                            .font(.system(size: 32))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                        CircleProgressBar()
                            .shadow(color: .white, radius: 30)
                        Spacer()
                            .frame(width: 24)
                    }
                }.padding(.bottom, -40)
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
