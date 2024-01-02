////
////  ThirdPartyProvider.swift
////  amoring
////
////  Created by 이준녕 on 12/22/23.
////
//
//import SwiftUI
//import AuthenticationServices
//import GoogleSignInSwift
//import GoogleSignIn
//import KakaoSDKCommon
//import KakaoSDKAuth
//import KakaoSDKUser
//
//class ThirdPartyProvider {
//    static let shared = ThirdPartyProvider()
//    
//    func signInWithApple() {
//        
//    }
//    
////    func authorizationController(controller: ASAuthorizationController,
////                                 didCompleteWithAuthorization authorization: ASAuthorization) {
////        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
////            guard let token = appleIdCredential.identityToken?.base64EncodedString()  else {
////                return
////            }
////            
////            // MARK: TODO
////            /// 1. Set token here
////            /// 2. Perform tasks to do after login
////            self.token = token
////        }
////    }
////    
////    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
////        print(error)
////    }
////    
////    private func performAppleSignIn() {
////        let provider = ASAuthorizationAppleIDProvider()
////        let request = provider.createRequest()
////        request.requestedScopes = [.fullName, .email]
////        let controller = ASAuthorizationController(authorizationRequests: [request])
////        controller.delegate = self
////        controller.performRequests()
////    }
//    
//    func appleButton() -> some View {
//        SignInWithAppleButton(
//            onRequest: { request in
//                request.requestedScopes = [.fullName, .email]
//            },
//            onCompletion: { result in
//                switch result {
//                case .success(let authResults):
//                    print("Apple Login Successful")
//                    switch authResults.credential{
//                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
//                        let UserIdentifier = appleIDCredential.user
//                        let fullName = appleIDCredential.fullName
//                        let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
//                        let email = appleIDCredential.email
//                        let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
//                        let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
//                        
////                        print(appleIDCredential)
//                        print(UserIdentifier)
////                        print(name)
////                        print(email)
////                        print(IdentityToken)
////                        print(AuthorizationCode)
//                    default:
//                        break
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    print("error")
//                }
//            }
//        )
//        .signInWithAppleButtonStyle(.white)
//        .labelStyle(.iconOnly)
//        .frame(width : 50, height: 50, alignment: .leading)
//                .cornerRadius(25)
//    }
//    
//    func googleButton() -> some View {
//        GoogleSignInButton {
//            self.signInWithGoogle { _ in
//                
//            }
//        }
//        .frame(width : 50, height: 50, alignment: .leading)
//                .cornerRadius(25)
//    }
//    
//    func signInWithGoogle(completion: @escaping (Bool) -> Void) {
//        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
//        
//        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
//            if let error {
//                print(error.localizedDescription)
//                completion(false)
//            } else {
//                print(result?.user.profile?.name)
//                print(result?.user.profile?.email)
//                print(result?.user.accessToken.tokenString)
//                print(result?.user.accessToken.expirationDate)
//                print(result?.user.idToken?.tokenString)
//                print(result?.user.idToken?.expirationDate)
//                print(result?.user.fetcherAuthorizer.description)
//                print(result?.user.userID)
//                completion(true)
//            }
//        }
//    }
//    
//    func signInWithKakao(completion: @escaping (Bool) -> Void) {
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error {
//                    print(error)
//                    completion(false)
//                } else {
//                    print(oauthToken)
//                    completion(true)
//                }
//            }
//        } else {
//            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                if let error {
//                    print(error)
//                    completion(false)
//                } else {
//                    print(oauthToken)
//                    completion(true)
//                }
//            }
//        }
//    }
//}
