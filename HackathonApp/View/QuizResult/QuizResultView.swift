import SwiftUI

struct QuizResultView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            Color("blue_7")
                .ignoresSafeArea()
            VStack {
                QuizResultHeader()
                    .frame(height: 191)
                    .ignoresSafeArea(edges: .top)
                QuizResultPlayers()
                    .environmentObject(userViewModel)
                    .offset(x: 0, y: -120)
                    .padding(.bottom, -120)
                Text("Поздравляю")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding(20)
                Text("Вы заработали 500 монет")
                    .foregroundColor(Color.white)
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
            .environmentObject(UserViewModel())
    }
}
