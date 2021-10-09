import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            VStack {
                GreetingsHeaderView()
                    .frame(height: 190)
                StoriesView()
                    .offset(y: -40)
                    .padding(.bottom, -40)
                MentorView()
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
    }
}
