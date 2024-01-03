//
//  UserOnboardingAge.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingAge: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var controller: UserOnboardingController
    @State private var datePickerSelection: Date = Date()
    @State private var goToPhoto: Bool = false
    @State private var sheetPresented: Bool = false
    @State var age: Int? = nil
    
    var partialRange: PartialRangeThrough<Date> {
        let eighteenYearsAgo = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return ...eighteenYearsAgo
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("회원님은\n몇년도에 태어났나요?")
                .font(bold32Font)
                .foregroundColor(.black)
                .padding(.top, Size.w(56))
                .padding(.horizontal, Size.w(14))
                .padding(.bottom, Size.w(66))
            
            
            PickerButton(age: $age).onTapGesture {
                sheetPresented = true
            }

            Spacer()
            
            Text("회원님의 프로필에 표시되는 정보로\n등록 후 변경은 불가하니 신중하게 입력하세요.")
                .font(regular16Font)
                .foregroundColor(.black)
                .multilineTextAlignment(.trailing)
                .lineSpacing(5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, Size.w(14))
                .padding(.bottom, Size.w(30))
            
            NavigationLink(isActive: $goToPhoto, destination: {
                UserOnboardingPhoto()
            }) {
                EmptyView()
            }
            
            HStack {
                Button(action: {
                    controller.user.birthDate = datePickerSelection
                    goToPhoto = true
                }) {
                    NextBlackButton(enabled: self.age != nil)
                }
                .disabled(self.age == nil)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom, Size.w(36))
        }
        .padding(.horizontal, Size.w(22))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow300)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("")
                    .font(medium20Font)
                    .foregroundColor(.black)
            }
        }
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: Size.w(20), height: Size.w(20))
                .foregroundColor(.black)
        }
        )
        .sheet(isPresented: $sheetPresented) {
            VStack {
                DatePicker(selection: $datePickerSelection, in: partialRange, displayedComponents: .date, label: {  })
                    .datePickerStyle(WheelDatePickerStyle())
                Button(action: {
                    controller.user.birthDate = datePickerSelection
                    self.age = Date().years(from: datePickerSelection)
                    sheetPresented = false
                }) {
                    Text("SAVE")
                }
            }
        }
    }
    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Step3")
//            Text("Please enter your age")
//            
//            DatePicker(selection: $datePickerSelection, in: partialRange, displayedComponents: .date, label: {  })
//                .datePickerStyle(WheelDatePickerStyle())
////            Picker("", selection: $selection) {
////                ForEach(18...100, id: \.self) {
////                    Text(String($0))
////                }
////            }
////            .pickerStyle(InlinePickerStyle())
//
//            Text("Visible to other users and cannot be changed after registration")
//
//            NavigationLink(isActive: $goToPhoto, destination: {
//                UserOnboardingPhoto()
//            }) {
//                EmptyView()
//            }
//            
//            Button(action: {
//                controller.user.birthDate = datePickerSelection
//                goToPhoto = true
//            }) {
//                Text("Next")
//            }
//            
//        }
//        .padding(16)
//    }
}

#Preview {
    NavigationView {
        UserOnboardingAge().environmentObject(UserOnboardingController()).navigationBarTitleDisplayMode(.inline)
    }
    
}
