//
//  AccountView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var userManager: UserManager
    
    @State private var pictures: [PictureModel] = []
    
    @State private var droppedOutside: Bool = false
    @State private var confirmRemoveImageIndex: Int = 0
    @State private var showRemoveConfirmation: Bool = false
    @State private var showContentTypeSheet: Bool = false
    @State private var showImagePicker: Bool = false
    
    //TODO: pass real user here
    @State var user = User(id: "asdasdsa", name: "Eugene Krabs", birthDate: "2000-01-01".toDate(), bio: "There is no knowledge\nThat is no power", gender: "MALE")
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack {
                    Text(user.name ?? "")
                    Text(user.age.description)
                    Text(user.gender ?? "")
                }
                
                PictureGridView(pictures: $pictures, droppedOutside: $droppedOutside, onAddedImageClick: { index in
                    confirmRemoveImageIndex = index
                    showRemoveConfirmation.toggle()
                }, onAddImageClick: {
                    showContentTypeSheet.toggle()
                })
                .padding(.horizontal)
                .sheet(isPresented: $showContentTypeSheet) {
                    ImagePicker(pictures: $pictures)
                }
    //            .alert("camera-permission-denied", isPresented: $showPermissionDenied, actions: {}, message: { Text("user-must-grant-camera-permission") })
                .alert("Remove this picture?", isPresented: $showRemoveConfirmation, actions: {
                    Button("Yes", action: removePicture)
                    Button("Cancel", role: .cancel, action: {})
                })
                
                Text("Bio")
                
                let charLimit: Int = 200
                
                TextEditor(text: $user.bio ?? "")
                    .onChange(of: user.bio ?? "", perform: { newValue in
                    if(newValue.count >= charLimit){
                        user.bio = String(newValue.prefix(charLimit))
                    }
                })
                    .frame(height: 300)
                
                HStack{
                    Spacer()
                    Text("\(charLimit - (user.bio?.count ?? 0))")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .bold()
                }
                
                Text("Amoring Settings")
                
                HStack {
                    Text("Likes: ")
                    Text("2")
                    Spacer()
                    Button(action: {}) {
                        Text("Purchse")
                    }
                }
                
                HStack {
                    Text("Hide my profile")
                    Spacer()
                    Button(action: {}) {
                        Text("Purchse")
                    }
                }
                
                HStack {
                    Text("Check out people you like")
                    Spacer()
                    Button(action: {}) {
                        Text("Purchse")
                    }
                }
                
                HStack {
                    Text("Amoring Community")
                    Spacer()
                    Button(action: {}) {
                        Text("Purchse")
                    }
                }
                
                Text("Terms of use")
                Text("Terms of Service")
                Text("Privacy Policy")
                Text("Contact Us/ Report")
                
                Text("Account")
                
                Button(action: {
                    withAnimation {
                        sessionManager.signedIn = false
                        sessionManager.isBusiness = false
                    }
                }) {
                    Text("LOGOUT")
                }
                
                Button(action: {

                }) {
                    Text("Deete account")
                }
                
                Spacer().frame(height: 200)
            }
            .padding(.horizontal, Size.w(22))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1000)
        .onAppear {
            if let user = userManager.user {
                self.user = user
            }
        }
    }
    
    private func removePicture() {
        pictures.remove(at: confirmRemoveImageIndex)
    }
}

#Preview {
    AccountView()
}
