//
//  ProfileCardView.swift
//  amoring
//
//  Created by 이준녕 on 11/30/23.
//

import SwiftUI

struct ProfileCardView: View {
    @EnvironmentObject var navigator: NavigationAmoringController
    let user: User

    private let screenWidthLimit = UIScreen.main.bounds.width * 0.5

    var body: some View {
        
            GeometryReader { reader in
                ZStack(alignment: .center) {
                ZStack(alignment: .bottom) {
                    Color.yellow350
                    VStack {
                        Image(user.fakeImage  ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    ZStack(alignment: .bottom) {
                        LinearGradient(colors: [
                            Color.clear,
                            Color.yellow350,
                            Color.yellow350,
                            Color.yellow350
                        ], startPoint: .top, endPoint: .bottom)
                        Image("tables-background")
                            .resizable()
                            .scaledToFill()
//                            .aspectRatio(contentMode: .fit)
                            .frame(height: Size.w(165))
                        
                        VStack(spacing: Size.w(10)) {
                            HStack {
                                Text(LocalizedStringKey(user.gender ?? ""))
                                    .font(semiBold12Font)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, Size.w(12))
                                    .padding(.vertical, Size.w(6))
                                    .background(Capsule().fill(Color.gray1000))
                                
                                Text(user.age.description + "세")
                                    .font(semiBold12Font)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, Size.w(12))
                                    .padding(.vertical, Size.w(6))
                                    .background(Capsule().fill(Color.gray1000))
                                
                                Text("테이블")
                                    .font(semiBold12Font)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, Size.w(12))
                                    .padding(.vertical, Size.w(6))
                                    .background(Capsule().fill(Color.green200))
                            }
                            
                            Text(user.name ?? "")
                                .font(bold32Font)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            Text(user.bio ?? "")
                                .font(medium16Font)
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                        .padding(.horizontal, Size.w(16))
                        .padding(.bottom, Size.w(22 + 36))
                    }
                    .frame(height: Size.w(186))
                }
                .frame(maxWidth: reader.size.width - Size.w(44), maxHeight: reader.size.height - Size.w(40))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                //            .padding(.horizontal, Size.w(22))
                .padding(.bottom, Size.w(40))
                .onTapGesture {
                    navigator.selectUser(user: user)
                }
            }
                .frame(maxWidth: reader.size.width, maxHeight: reader.size.height)
        }
    }
}

#Preview {
    SessionView()
}