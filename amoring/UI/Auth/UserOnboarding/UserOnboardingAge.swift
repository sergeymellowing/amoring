//
//  UserOnboardingStep3.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingAge: View {
//    @State var selection: Int = 30
    @State private var datePickerSelection: Date = Date()
    
    var partialRange: PartialRangeThrough<Date> {
        let eighteenYearsAgo = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return ...eighteenYearsAgo
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step3")
            Text("Please enter your age")
            
            DatePicker(selection: $datePickerSelection, in: partialRange, displayedComponents: .date, label: { Text("pick-your-birthday") })
            
//            Picker("", selection: $selection) {
//                ForEach(18...100, id: \.self) {
//                    Text(String($0))
//                }
//            }
//            .pickerStyle(InlinePickerStyle())

            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: { UserOnboardingPhoto() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingAge()
}
