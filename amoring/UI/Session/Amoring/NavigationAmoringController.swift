//
//  NavigationAmoringController.swift
//  amoring
//
//  Created by 이준녕 on 12/4/23.
//

import SwiftUI
import NavigationStackBackport

class NavigationAmoringController: ObservableObject {
    @Published var path = NavigationStackBackport.NavigationPath()
    @Published var selectedUser: User? = nil
    @Published var amoring: Bool = false
    @Published var showDetails: Bool = false
    
//    func selectUser(user: User) {
//        withAnimation {
//            self.selectedUser = self.selectedUser == user ? nil : user
//        }
//    }
    
//    func navigate(screen: AmoringPath) -> some View {
//        switch screen {
//        case .details: return DetailsView().environmentObject(self)
//        }
//    }
}

enum AmoringPath: Hashable {
    case details
}
