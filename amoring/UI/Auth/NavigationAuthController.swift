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
    
    func navigate(screen: AuthPath) -> some View {
        switch screen {
        case .businessSignIn: return  BusinessSignInView().environmentObject(self)
        }
    }
}

enum AuthPath: Hashable {
    case businessSignIn
}
