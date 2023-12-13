//
//  ProfileCardView.swift
//  amoring
//
//  Created by 이준녕 on 11/30/23.
//

import SwiftUI

struct ProfileCardView: View {
    let user: User
    let width: CGFloat
    
    var body: some View {
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
            .frame(maxWidth: width, maxHeight: 500)
            .cornerRadius(24, corners: [.topLeft, .topRight])
        }
    }
}

#Preview {
    ProfileCardView(user: Dummy.users.first!, width: UIScreen.main.bounds.width - Size.w(44))
}


