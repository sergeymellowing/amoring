//
//  SessionManager.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

class SessionManager: ObservableObject {
    ///Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
    @Published var isLoading: Bool = true
    @Published var signedIn: Bool = false
    @Published var isBusiness: Bool = true
    
//    @MainActor 
    func getCurrentSession() {
        Task {
            isLoading = true
            sleep(4)
            withAnimation(.smooth) {
                isLoading = false
            }
            
    //        await signIn()
            print("current session")
        }
    }
    
    func signIn() async {
        isLoading = true
        sleep(2)
        
            self.signedIn = true
        
        
        isLoading = false
        print("signed in")
    }
}
