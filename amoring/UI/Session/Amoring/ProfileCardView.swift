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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .bottom) {
                VStack {
                    // TODO: pass from user
                    Image("person-0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(24)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.yellow350)
                
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
                    
                    VStack(spacing: 10) {
                        HStack {
                            Text(" 남 ")
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(Color.gray1000))
                            
                            Text("26세")
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(Color.gray1000))
                            
                            Text("테이블")
                                .foregroundColor(.black)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(Color.green200))
                        }
                        /// name, family name
                        Text("Eugene Krabs")
                            .font(bold32Font)
                            .foregroundColor(.black)
                        /// bio
                        Text("저희 3명이고, 테이블 잡음, 술 있음")
                    }
                    
                    .padding(.top, 10)
                }
                .frame(height: 186)
            }
            .cornerRadius(24)
            .padding(.bottom, 40)
            .onTapGesture {
                navigator.selectUser(user: user)
            }
            
            HStack {
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle().frame(width: 76, height: 76)
                            .foregroundColor(.gray900)
                        Image("dislike-cross")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 29, height: 29)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle().frame(width: 76, height: 76)
                            .foregroundColor(.gray900)
                        Image("ic-heart-fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 30)
                            .foregroundColor(.yellow200)
                    }
                }
                
            }
            .padding(.horizontal, 40)
        }
        // TODO: do we need it???
        .frame(minHeight: 500, maxHeight: 600)
    }
}

#Preview {
    VStack {
        VStack {
            Spacer().frame(height: 100)
            ProfileCardView(user: User())
            Spacer().frame(height: 100)
        }
        .padding(.horizontal, 22)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray1000)
}
