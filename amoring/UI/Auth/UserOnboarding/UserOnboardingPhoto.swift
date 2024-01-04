//
//  UserOnboardingPhoto.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingPhoto: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var controller: UserOnboardingController
    
    @State private var pictures: [PictureModel] = []
    
    @State private var droppedOutside: Bool = false
    @State private var confirmRemoveImageIndex: Int = 0
    @State private var showRemoveConfirmation: Bool = false
    @State private var showContentTypeSheet: Bool = false
    @State private var showPermissionDenied: Bool = false
    @State private var goToStep5: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("사진을 추가하세요")
                .font(bold32Font)
                .foregroundColor(.black)
                .padding(.horizontal, Size.w(36))
                .padding(.top, Size.w(56))
                .padding(.bottom, Size.w(10))
                
            Text("프로필에 **3개의 사진은 꼭** 등록해주셔야 합니다.\n그래야 인연을 찾을 확률이 높아져요!")
                .font(regular16Font)
                .foregroundColor(.black)
                .padding(.horizontal, Size.w(36))
                .padding(.bottom, Size.w(40))
            
            PictureGridView(pictures: $pictures, droppedOutside: $droppedOutside, onAddedImageClick: { index in
                confirmRemoveImageIndex = index
                showRemoveConfirmation.toggle()
            }, onAddImageClick: {
                showContentTypeSheet.toggle()
            }).padding(.horizontal, Size.w(14))

            Spacer()
            
            Text("사진아래 번호 순서로 노출이 됩니다.")
                .font(regular16Font)
                .foregroundColor(.black)
                .multilineTextAlignment(.trailing)
                .lineSpacing(5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, Size.w(36))
                .padding(.bottom, Size.w(30))
            
            NavigationLink(isActive: $goToStep5, destination: {
                UserOnboardingIntro()
            }) {
                EmptyView()
            }
            
            HStack {
                Button(action: {
                    // TODO: Save images to db at this point
                    controller.user.pictures = pictures.map({ $0.picture.description })
                    print("\(pictures.count) pictures saved!")
                    goToStep5 = true
                }) {
                    NextBlackButton(enabled: pictures.count >= 3)
                }
                .disabled(pictures.count < 3)
                .opacity(pictures.count < 3 ? 0.5 : 1)
                .sheet(isPresented: $showContentTypeSheet) {
                    ImagePicker(pictures: $pictures, limit: 6 - pictures.count).ignoresSafeArea()
                }
                //            .alert("camera-permission-denied", isPresented: $showPermissionDenied, actions: {}, message: { Text("user-must-grant-camera-permission") })
                            .alert("Remove this picture?", isPresented: $showRemoveConfirmation, actions: {
                                Button("Yes", action: removePicture)
                                Button("Cancel", role: .cancel, action: {})
                            })
                        
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, Size.w(22))
            .padding(.bottom, Size.w(36))
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow300)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("")
                    .font(medium20Font)
                    .foregroundColor(.black)
            }
        }
        .navigationBarItems(leading:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: Size.w(20), height: Size.w(20))
                .foregroundColor(.black)
        }
        )
    }
    
//    var body: some View {
//        
//        VStack(spacing: 20) {
//            Text("Step4")
//            Text("Please add photo")
//            Text("Please select at least 3")
//
//            PictureGridView(pictures: $pictures, droppedOutside: $droppedOutside, onAddedImageClick: { index in
//                confirmRemoveImageIndex = index
//                showRemoveConfirmation.toggle()
//            }, onAddImageClick: {
//                showContentTypeSheet.toggle()
//            }).padding(.horizontal)
//            
//        
//            NavigationLink(isActive: $goToStep5, destination: {
//                UserOnboardingBio()
//            }) {
//                EmptyView()
//            }
//            
//            Button(action: {
//                // TODO: Save images to db at this point
//                controller.user.pictures = pictures.map({ $0.picture.description })
//                print("\(pictures.count) pictures saved!")
//                goToStep5 = true
//            }) {
//                Text("Next")
//            }
//            .disabled(pictures.count < 3)
//            .opacity(pictures.count < 3 ? 0.5 : 1)
//            .sheet(isPresented: $showContentTypeSheet) {
//                ImagePicker(pictures: $pictures)
//            }
////            .alert("camera-permission-denied", isPresented: $showPermissionDenied, actions: {}, message: { Text("user-must-grant-camera-permission") })
//            .alert("Remove this picture?", isPresented: $showRemoveConfirmation, actions: {
//                Button("Yes", action: removePicture)
//                Button("Cancel", role: .cancel, action: {})
//            })
//        }
////        .textFieldStyle(.roundedBorder)
//    }
    
    private func removePicture() {
        pictures.remove(at: confirmRemoveImageIndex)
    }
}

#Preview {
    UserOnboardingPhoto().environmentObject(UserOnboardingController())
}
