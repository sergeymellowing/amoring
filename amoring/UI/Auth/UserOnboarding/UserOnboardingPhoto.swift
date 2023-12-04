//
//  UserOnboardingPhoto.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingPhoto: View {
    @EnvironmentObject var controller: UserOnboardingController
    
    @State private var pictures: [PictureModel] = []
    
    @State private var droppedOutside: Bool = false
    @State private var confirmRemoveImageIndex: Int = 0
    @State private var showRemoveConfirmation: Bool = false
    @State private var showContentTypeSheet: Bool = false
    @State private var showPermissionDenied: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var goToStep5: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step4")
            Text("Please add photo")
            Text("Please select at least 3")

            PictureGridView(pictures: $pictures, droppedOutside: $droppedOutside, onAddedImageClick: { index in
                confirmRemoveImageIndex = index
                showRemoveConfirmation.toggle()
            }, onAddImageClick: {
                showContentTypeSheet.toggle()
            }).padding(.horizontal)
            
        
            NavigationLink(isActive: $goToStep5, destination: {
                UserOnboardingBio()
            }) {
                EmptyView()
            }
            
            Button(action: {
                // TODO: Save images to db at this point
                controller.user.pictures = pictures.map({ $0.picture.description })
                print("\(pictures.count) pictures saved!")
                goToStep5 = true
            }) {
                Text("Next")
            }
            .disabled(pictures.count < 3)
            .opacity(pictures.count < 3 ? 0.5 : 1)
            .sheet(isPresented: $showContentTypeSheet) {
                ImagePicker(pictures: $pictures)
            }
//            .alert("camera-permission-denied", isPresented: $showPermissionDenied, actions: {}, message: { Text("user-must-grant-camera-permission") })
            .alert("Remove this picture?", isPresented: $showRemoveConfirmation, actions: {
                Button("Yes", action: removePicture)
                Button("Cancel", role: .cancel, action: {})
            })
        }
//        .textFieldStyle(.roundedBorder)
    }
    
    private func removePicture() {
        pictures.remove(at: confirmRemoveImageIndex)
    }
}

//#Preview {
//    UserOnboardingPhoto()
//}
