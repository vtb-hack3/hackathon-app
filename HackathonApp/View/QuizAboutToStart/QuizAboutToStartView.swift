import SwiftUI

struct QuizAboutToStartView: View {
    @State var opponent: Opponent
    @State var myPictureId: Int
    @State var myName: String

    var body: some View {
        VStack {
            Group {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .offset(x: 0, y: 30)
            Text("Игра найдена!")
                .font(.system(size: 30, weight: .medium))
                .padding()
            ZStack {
                Color("blue_5")
                    .frame(height: 160)
                HStack {
                    Spacer()
                    VStack {
                        Image.profile(by: myPictureId)
                        Text(myName)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    .padding()
                    Spacer()
                    Text("VS")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold))
                    Spacer()
                    VStack {
                        Image.profile(by: opponent.pictureId)
                        Text(opponent.name)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    .padding()
                    Spacer()
                }
            }
            Text("Начинаем...")
                .font(.system(size: 23))
                .foregroundColor(Color("blue_6"))
                .padding()
            ProgressView()
            Spacer()
                .frame(maxHeight: .infinity, alignment: .topLeading)

        }
        .navigationBarHidden(true)
    }
}

struct QuizAboutToStartView_Previews: PreviewProvider {
    static var previews: some View {
        QuizAboutToStartView(
            opponent: .init(name: "Vladimir", pictureId: 2),
            myPictureId: 3,
            myName: "Valter"
        )
    }
}