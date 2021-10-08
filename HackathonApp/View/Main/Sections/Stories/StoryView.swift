import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.yellow, lineWidth: 4)
                .background(Circle().foregroundColor(Color("blue_8")))
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
