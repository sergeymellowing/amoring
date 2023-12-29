//
//  NavigationAuthController.swift
//  amoring
//
//  Created by 이준녕 on 12/4/23.
//

import SwiftUI
import NavigationStackBackport

class NavigationAuthController: ObservableObject {
    @Published var path = NavigationStackBackport.NavigationPath()
    
    func toRoot() {
        path.removeLast()
    }
    
    func toBusinessSignIn() {
        path.append(AuthPath.businessSignIn)
    }
    
    func toBusinessSignUp() {
        path.append(AuthPath.businessSignUp)
    }
    
    func navigate(screen: AuthPath) -> some View {
        ZStack {
            switch screen {
            case .businessSignIn:
                BusinessSignInView().environmentObject(self)
            case .businessSignUp:
                BusinessSignUp().environmentObject(self)
            }
        }
    }
}

enum AuthPath: Hashable {
    case businessSignIn, businessSignUp
}
