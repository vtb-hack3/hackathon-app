import SwiftUI

struct CircleProgressBar: View {
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 52, height: 52, alignment: .trailing)
                .cornerRadius(26)
            Text("20%")
                .font(.system(size: 15))
            Circle()
                .trim(from: 0.0, to: 0.2)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .opacity(1)
                .foregroundColor(Color("blue_5"))
                .frame(width: 44, height: 44)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
