//
//  BusinessSignInSheet.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct BusinessSignInSheet: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State var email: String = ""
    @State var password: String = ""
    @State var remember: Bool = true
    @State var autologin: Bool = true
    
    @EnvironmentObject var navigator: NavigationAuthController
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            Image("LOGO")
                .resizable()
                .scaledToFit()
                .frame(width: Size.w(84), height: Size.w(72))
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .center)
                .offset(y: Size.w(17))
                .zIndex(2)
            
            VStack(alignment: .center, spacing: 0) {
                Text("비즈니스")
                    .font(bold28Font)
                    .foregroundColor(.gray150)
                    .padding(.top, Size.w(40))
                    .padding(.bottom, Size.w(10))
                
                Text("아모링 비즈니스에 오신걸 환영합니다.")
                    .font(medium14Font)
                    .foregroundColor(.gray600)
                    .padding(.bottom, Size.w(40))
                
                Text("이메일")
                    .font(regular14Font)
                    .foregroundColor(.gray600)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, Size.w(14))
                    .padding(.bottom, Size.w(8))
                    
                CustomTextField(placeholder: "가입하신 이메일", text: $email, font: medium18Font, placeholderFont: regular18Font)
                    .padding(.bottom, Size.w(16))
                
                Text("비밀번호")
                    .font(regular14Font)
                    .foregroundColor(.gray600)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, Size.w(14))
                    .padding(.bottom, Size.w(8))
                    
                CustomSecureField(placeholder: "비밀번호", text: $password, font: medium18Font, placeholderFont: regular18Font)
                    .padding(.bottom, Size.w(22))
                
                HStack(spacing: Size.w(16)) {
                    //TODO: userDefaults for these two variables
                    Button(action: {
                        remember.toggle()
                    }) {
                        HStack {
                            Image(systemName: remember ? "checkmark.square" : "square")
                                .font(regular18Font)
                                .foregroundColor(.yellow600)
                            Text("기억하기")
                                .font(regular16Font)
                                .foregroundColor(.gray400)
                        }
                    }
                    
                    Button(action: {
                        autologin.toggle()
                    }) {
                        HStack {
                            Image(systemName: autologin ? "checkmark.square" : "square")
                                .font(regular18Font)
                                .foregroundColor(.yellow600)
                            Text("자동로그인")
                                .font(regular16Font)
                                .foregroundColor(.gray400)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, Size.w(22))
                
                Button(action: {
                    withAnimation {
                        sessionManager.businessSignIn(email: email, password: password)
//                        sessionManager.BusinessSignedIn = true
                    }
                }) {
                    FullSizeButton(title: "로그인", color: Color.black, bg: Color.yellow300, enabled: filled)
                }
                .padding(.bottom, Size.w(22))
                    
                HStack(spacing: Size.w(16)) {
                    //TODO: forgot password
                    NavigationLink(destination: {
                            Text("FORGOT PASSWORD")
                    }) {
                        Text("비밀번호를 잊으셨나요?")
                            .font(regular14Font)
                            .foregroundColor(.gray600)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, Size.w(85))
                
                Button(action: {
                    //TODO: business sign up
                    print("go to business sign up")
                }) {
                    HStack {
                        Text("아직 아모링 비즈니스가 아니신가요?").foregroundColor(.gray600)
                        Text("가입하기").foregroundColor(.yellow600)
                    }
                    .font(regular14Font)
                }
                .padding(.bottom, Size.w(50))
                .padding(.bottom, Size.safeArea().bottom)
            }
            .padding(.horizontal, Size.w(22))
            .frame(maxWidth: UIScreen.main.bounds.width)
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .bottom)
        .transition(.move(edge: .bottom))
    }
    
    private var filled: Bool {
        //TODO: add email format checking...
        return !email.isEmpty && !password.isEmpty
    }
    
    private func goNext() {
        //        if user.exists {
        //            go to session
        //        } else {
        withAnimation {
//            goToUserOnboarding = true
        }
        //        }
    }
}

#Preview {
    BusinessSignInSheet()
}