import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ScrollView {
            VStack {
                //
                //coins
                ProfileHeaderView(
                    levelImage: .imageName(from: userViewModel.rank),
                    level: String.rank(from: userViewModel.rank),
                    coins: userViewModel.coins
                )
                    .frame(height: 191)
                    .cornerRadius(radius: 35, corners: [.bottomRight, .bottomLeft])
                    .ignoresSafeArea(edges: .top)
                ZStack {
                    Color("blue_3")
                        .clipShape(Circle())
                    Image.profile(
                        by: $userViewModel.pictureId.wrappedValue
                    )
                        .resizable()
                        .padding(32)
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
                // 5000 - 7
                // rankPoints - ?
                // rankPoints * 7 / 5000
                ProfileSliderView(value: max($userViewModel.rankPoints.wrappedValue, 1) * 8 / 5000
                )
                    .padding(.top, 10)
                    .padding(.bottom, 24)
                    .padding(.horizontal)
                ProfileItemView(
                    imageName: "status_item",
                    title: "Мой уровень",
                    subtitle: String.rank(from: userViewModel.rank)
                )
                    .padding(.bottom, 14)
                    .padding(.leading)
                if userViewModel.rank != .expert {
                    ProfileItemView(
                        imageName: "done_item",
                        title: "До следующего уровня",
                        subtitle: "\(calculateNextLevel(rank: userViewModel.rank, rankPoints: userViewModel.rankPoints)) монет"
                    )
                        .padding(.bottom, 32)
                        .padding(.leading)
                }
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

    private func calculateNextLevel(rank: UserViewModel.Rank, rankPoints: Int) -> Int {
        switch rank {
        case .newbie:
            return 2500 - rankPoints
        case .expirienced:
            return 5000 - rankPoints
        case .expert:
            return 0
        }
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
            .environmentObject(UserViewModel.init())
    }
}
