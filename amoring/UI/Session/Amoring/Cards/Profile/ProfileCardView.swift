//
//  ProfileCardView.swift
//  amoring
//
//  Created by 이준녕 on 11/30/23.
//

import SwiftUI
import CachedAsyncImage

struct ProfileCardView: View {
    let user: User
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack(alignment: .bottom) {
                Color.yellow350
                VStack {
                    let colors: [Color] = [.black, .black, .black, .black, .black, .black, .black, .black, .clear]
                    let url = user.pictures?.first
                    CachedAsyncImage(url: URL(string: url ?? ""), content: { cont in
                        cont
                            .resizable()
                            .scaledToFit()
                    }, placeholder: {
                        ZStack {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.gray1000))
                        }.frame(width: width, height: height, alignment: .center)
                    })
                    
//                    Image(user.fakeImage  ?? "")
//                        .resizable()
//                        .scaledToFit()
                        .mask(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                }
                .frame(width: width, height: height, alignment: .top)
                
//                Color.red.opacity(0.5)
//                    .frame(width: width, height: Size.w(186))
               UserInfoView(user: user)
                
            }
            .frame(maxWidth: width, maxHeight: height)
            .cornerRadius(24, corners: [.topLeft, .topRight])
        }
    }
}

struct UserInfoView: View {
    @EnvironmentObject var navigator: NavigationAmoringController
    
    let user: User
    var body: some View {
        ZStack(alignment: .top) {
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
            
            VStack(alignment: navigator.showDetails ? .leading : .center, spacing: Size.w(10)) {
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
                }.frame(maxWidth: .infinity, alignment: navigator.showDetails ? .leading : .center)
                
                Text(user.name ?? "")
                    .font(bold32Font)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(user.bio ?? "")
                    .font(medium16Font)
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            .padding(.horizontal, Size.w(22))
            .padding(.top, Size.w(16))
            .onChange(of: navigator.showDetails) { bool in
                    print("navigator.showDetails: \(bool)")
            }
//            .padding(.bottom, Size.w(22 + 36))
        }
        .frame(height: Size.w(186), alignment: .top)
    }
}

#Preview {
    ProfileCardView(user: Dummy.users.first!, width: UIScreen.main.bounds.width - Size.w(44), height: 500)
}


