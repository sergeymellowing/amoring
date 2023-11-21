//
//  UserOnboardingStep5.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingBio: View {
    @State var text = ""
    
    private let charLimit: Int = 200
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step5")
            Text("Lastly, please explain yourself\n(40 characters or less)")
            
            TextEditor(text: $text)
                .onChange(of: text, perform: { newValue in
                if(newValue.count >= charLimit){
                    text = String(newValue.prefix(charLimit))
                }
            })
            
            HStack{
                Spacer()
                Text("\(charLimit - text.count)").foregroundColor(.gray).font(.headline).bold()
            }

            NavigationLink(destination: { UserOnboardingTerms() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingBio()
}
