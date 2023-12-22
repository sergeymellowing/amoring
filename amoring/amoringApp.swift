//
//  amoringApp.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import GoogleSignIn
//import NaverThirdPartyLogin

@main
struct amoringApp: App {
    init() {
        KakaoSDK.initSDK(appKey: "88a121ae97540f56f106e7f52609022c")
        
//        NaverThirdPartyLoginConnection
//               .getSharedInstance()
//               .receiveAccessToken(URLContexts.first?.url)
    }
    
    var body: some Scene {
        WindowGroup {
            //            RocketListView()
//            PurchaseView(model: purchasesList[3])
            
            
            ContentView()
                .preferredColorScheme(.dark)
            // TODO: remove for different languages
                .environment(\.locale, .init(identifier: "ko"))
                .onAppear {
                    setupUI()
                }
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    } else {
                        GIDSignIn.sharedInstance.handle(url)
                    }
                }
        }
    }
    
    func setupUI() {
        /// Hides native TabBar
        UITabBar.appearance().isHidden = true
    }
}
