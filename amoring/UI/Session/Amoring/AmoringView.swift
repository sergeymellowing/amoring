//
//  AmoringView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct AmoringView: View {
    @StateObject var navigator = NavigationAmoringController()
    @StateObject var userManager = UserManager()
    
    var body: some View {
        Group {
            if navigator.checkIn != nil {
                ProfilesView()
            } else {
                CheckInView()
            }
        }
        .environmentObject(navigator)
        .onAppear {
            /// getting existed check in session
            //            navigator.checkIn = CheckIn(userId: userManager.user?.id, businessId: 123, place: "resultString", checkedInAt: Date().addingTimeInterval(-123 * 59), checkedOutAt: nil)
        }
    }
}

#Preview {
    SessionView()
}
