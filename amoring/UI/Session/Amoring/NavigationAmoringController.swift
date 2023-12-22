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
//    @Published var amoring: Bool = false
    @Published var showDetails: Bool = false
    @Published var hidePanel: Bool = false
    // TODO: fetch this object when app starts
    @Published var checkIn: CheckIn? = nil
    
//    func selectUser(user: User) {
//        self.selectedUser = user
//        path.append(AmoringPath.details)
//    }
//    
//    func navigate(screen: AmoringPath) -> some View {
//        switch screen {
//        case .details: return DetailsView().environmentObject(self)
//        }
//    }
    
    func leave() {
        // TODO: Save to DB and delete current check in object
        withAnimation {
            self.checkIn?.checkedOutAt = Date()
            self.checkIn = nil
        }
    }
}

enum AmoringPath: Hashable {
    case details
}
