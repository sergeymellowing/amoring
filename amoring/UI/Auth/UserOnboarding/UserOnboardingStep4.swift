//
//  UserOnboardingStep4.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingStep4: View {
    @State private var pictures: [PictureModel] = []
    @State private var image = UIImage()
    
    @State private var droppedOutside: Bool = false
    @State private var confirmRemoveImageIndex: Int = 0
    @State private var showRemoveConfirmation: Bool = false
    @State private var showContentTypeSheet: Bool = false
    @State private var showPermissionDenied: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var selectedContentType: UIImagePickerController.SourceType = .photoLibrary
    
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
            })
                    .padding(.leading).padding(.trailing)
            
            NavigationLink(destination: { UserOnboardingStep4() }) {
                Text("Next")
            }
            .disabled(pictures.count < 3)
            .opacity(pictures.count < 3 ? 0.5 : 1)
            .onChange(of: image, perform: { newValue in
                pictures.append(PictureModel.newPicture(newValue))
            })
//            .sheet(isPresented: $showContentTypeSheet) {
//                ContentTypeView(onContentTypeSelected: { contentType in
//                    switch contentType {
//                    case .permissionDenied:
//                        showPermissionDenied.toggle()
//                        return
//                    case .contentType(let sourceType):
//                        self.selectedContentType = sourceType
//                        showImagePicker.toggle()
//                        return
//                    }
//                })
//            }
            .sheet(isPresented: $showContentTypeSheet) {
                ImagePicker(sourceType: selectedContentType, selectedImage: $image)
            }
//            .alert("camera-permission-denied", isPresented: $showPermissionDenied, actions: {}, message: { Text("user-must-grant-camera-permission") })
            .alert("Remove this picture?", isPresented: $showRemoveConfirmation, actions: {
                Button("Yes", action: removePicture)
                Button("Cancel", role: .cancel, action: {})
            })
        }
    }
    
    private func removePicture() {
        pictures.remove(at: confirmRemoveImageIndex)
    }
}

#Preview {
    UserOnboardingStep4()
}
