//
//  DetailsView.swift
//  amoring
//
//  Created by 이준녕 on 12/4/23.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var navigator: NavigationAmoringController
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
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
                                Text("MALE")
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
                
                Text(navigator.selectedUser?.name ?? "")
                Text("DETAILS")
                Text("DETAILS")
                Text("DETAILS")
                Text("DETAILS")
            }
        }
    }
}

#Preview {
    DetailsView()
}
