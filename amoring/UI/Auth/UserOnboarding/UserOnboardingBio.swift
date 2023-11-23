//
//  UserOnboardingBio.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingBio: View {
    @EnvironmentObject var controller: UserOnboardingController
    
    private let charLimit: Int = 200
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step5")
            Text("Lastly, please explain yourself\n(40 characters or less)")
            
            TextEditor(text: $controller.user.bio ?? "")
                .onChange(of: controller.user.bio ?? "", perform: { newValue in
                if(newValue.count >= charLimit){
                    controller.user.bio = String(newValue.prefix(charLimit))
                }
            })
            
            HStack{
                Spacer()
                Text("\(charLimit - (controller.user.bio?.count ?? 0))").foregroundColor(.gray).font(.headline).bold()
            }

            NavigationLink(destination: { UserOnboardingTerms() }) {
                Text("Next")
            }
        }
        .padding(16)
    }
}

//#Preview {
//    UserOnboardingBio()
//}
