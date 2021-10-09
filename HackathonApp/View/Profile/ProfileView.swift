import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .frame(height: 191)
                    .cornerRadius(radius: 35, corners: [.bottomRight, .bottomLeft])
                    .ignoresSafeArea(edges: .top)
                ZStack {
                    Color("blue_3")
                        .clipShape(Circle())
                    Image("user_avatar")
                }
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("1"), lineWidth: 2))
                    .frame(width: 196, height: 196)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                HStack {
                    createlevelView(
                        imageName: "level",
                        title: "Новичок"
                    )
                    Spacer()
                    createlevelView(
                        imageName: "level_2",
                        title: "Опытный"
                    )
                    Spacer()
                    createlevelView(
                        imageName: "level_3",
                        title: "Знаток"
                    )
                }
                    .padding(.top, 60)
                    .padding(.horizontal)
                ProfileSliderView(value: 3)
                    .padding(.top, 10)
                    .padding(.bottom, 24)
                    .padding(.horizontal)
                ProfileItemView(
                    imageName: "status_item",
                    title: "Мой уровень",
                    subtitle: "Новичок"
                )
                    .padding(.bottom, 14)
                    .padding(.leading)
                ProfileItemView(
                    imageName: "done_item",
                    title: "До следующего уровня",
                    subtitle: "2500 монет"
                )
                    .padding(.bottom, 32)
                    .padding(.leading)
                Button(action: {
                    //                            self.selectedPoster = nil
                }) {
                    ZStack {
                        Color.white
                        HStack {
                            Text("Поделиться с друзьями")
                                .foregroundColor(Color.black)
                            Spacer()
                            Image("share")
                        }
                        .padding(.horizontal)
                    }
                    .cornerRadius(16)
                }
                .shadow(color: .black.opacity(0.1), radius: 7)
                .padding(.horizontal)
                .frame(height: 58)
                ProfileBurseView()
                    .padding(.top, 42)
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.bottom, 50)
        }
        .ignoresSafeArea(edges: .top)
    }

    private func createlevelView(
        imageName: String,
        title: String
    ) -> some View {
        VStack {
            ZStack {
                Color("blue_9")
                Text(title)
                    .foregroundColor(.white)

            }
            .cornerRadius(20)
            .frame(width: 100, height: 32)
            Image(imageName)
                .offset(y: -75)
                .padding(.bottom, -75)
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
