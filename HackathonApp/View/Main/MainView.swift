import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            GreetingsHeaderView()
                .frame(height: 190)
            StoriesView()
                .offset(x: 0, y: -40)
            MentorView()
            TutorialBooks()
            TestListView()
            Color.white
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
