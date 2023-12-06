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
            ZStack(alignment: .bottom) {
                Color.yellow350
                VStack {
                    Image(user.fakeImage  ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(maxWidth: reader.size.width, maxHeight: reader.size.height - Size.w(40), alignment: .top)
                
                ZStack(alignment: .top) {
                    VStack(spacing: 0) {
                        LinearGradient(colors: [
                            Color.clear,
                            Color.yellow350,
                        ], startPoint: .top, endPoint: .bottom)
                        Color.yellow350
                        Color.yellow350
                    }
                    Image("tables-background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(spacing: Size.w(10)) {
                        HStack {
                            Text(" 남 ")
                                .foregroundColor(.white)
                                .padding(.horizontal, Size.w(12))
                                .padding(.vertical, Size.w(6))
                                .background(Capsule().fill(Color.gray1000))
                            
                            Text("26세")
                                .foregroundColor(.white)
                                .padding(.horizontal, Size.w(12))
                                .padding(.vertical, Size.w(6))
                                .background(Capsule().fill(Color.gray1000))
                            
                            Text("테이블")
                                .foregroundColor(.black)
                                .padding(.horizontal, Size.w(12))
                                .padding(.vertical, Size.w(6))
                                .background(Capsule().fill(Color.green200))
                        }
                        /// name, family name
                        Text("Eugene Krabs")
                            .font(bold32Font)
                            .foregroundColor(.black)
                        /// bio
                        Text("저희 3명이고, 테이블 잡음, 술 있음")
                    }
                    .padding(.top, Size.w(10))
                }
                .frame(height: Size.w(186))
            }
            .frame(maxWidth: reader.size.width, maxHeight: reader.size.height - Size.w(40))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, Size.w(22))
            .padding(.bottom, Size.w(40))
            .onTapGesture {
                navigator.selectUser(user: user)
            }
        }
    }
}

#Preview {
    SessionView()
}
