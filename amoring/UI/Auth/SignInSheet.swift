//
//  SignInSheet.swift
//  amoring
//
//  Created by 이준녕 on 12/29/23.
//

import SwiftUI

struct SignInSheet: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var navigator: NavigationAuthController
    @Binding var goToUserOnboarding: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            VStack(alignment: .center) {
                Text("시작하기")
                    .font(bold28Font)
                    .foregroundColor(.gray150)
                    .padding(.top, Size.w(40))
                    .padding(.bottom, Size.w(10))
                
                Text("간편하게 SNS로 빠르게 시작해보세요!")
                    .font(medium14Font)
                    .foregroundColor(.gray600)
                    .padding(.bottom, Size.w(40))
                
                
                // TODO: get user from db if exists and skip useronboarding part else go to userOnboarding
                
                HStack {
                    Image("SNS-google")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Image("SNS-apple")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Image("SNS-facebook")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Image("SNS-naver")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Image("SNS-kakao")
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth: UIScreen.main.bounds.width - Size.w(60), maxHeight: Size.w(54))
                .padding(.bottom, Size.w(152))
                .onTapGesture {
                    sessionManager.isBusiness = false
                    sessionManager.signedIn = true
                }
                HStack {
                    Button(action: {
                        navigator.toBusinessSignUp()
                    }) {
                        Text("비즈니스 가입 ")
                    }
                    
                    Divider().frame(height: Size.w(16))
                    
                    Button(action: {
                        navigator.toBusinessSignIn()
                    }) {
                        Text("비즈니스 로그인")
                    }
                }
                .font(medium16Font)
                .foregroundColor(.gray600)
                .padding(.bottom, Size.w(50))
                
                //                    Button(action: goNext) {
                //                        Text("Facebook")
                //                    }
                //                    ThirdPartyProvider.shared.googleButton()
                //                    ThirdPartyProvider.shared.appleButton()
                //
                //                    HStack(spacing: 20) {
                //                        Button(action: goNext) {
                //                            Text("Naver")
                //                        }
                //                        ThirdPartyProvider.shared.kakaoButton()
                //                    }
                //
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .bottom)
        .transition(.move(edge: .bottom))
    }
    
    
    
    private func goNext() {
        //        if user.exists {
        //            go to session
        //        } else {
        withAnimation {
            goToUserOnboarding = true
        }
        //        }
    }
}

#Preview {
    SignInSheet(goToUserOnboarding: .constant(false))
}
