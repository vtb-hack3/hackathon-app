import SwiftUI

struct MainView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ScrollView {
            VStack {
                GreetingsHeaderView()
                    .environmentObject(userViewModel)
                    .frame(height: 190)
                Image("open_broker")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        if let url = URL(string: "https://broker.vtb.ru/login/vtbinvest/") {
                            UIApplication.shared.open(url)
                        }
                    }
                Spacer(minLength: 16)
                TutorialBooks()
                Spacer(minLength: 32)
                TestListView()
                Color.white
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .environmentObject(UserViewModel())
    }
}
