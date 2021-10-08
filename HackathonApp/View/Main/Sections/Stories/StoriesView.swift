import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer()
                    .frame(width: 16)
                ForEach(0..<10) { index in
                    StoryView()
                        .frame(width: 70, height: 70)
                }
                Spacer()
                    .frame(width: 16)
            }
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
