//
//  PeopleLikesView.swift
//  amoring
//
//  Created by 이준녕 on 12/18/23.
//

import SwiftUI

struct PeopleLikesView: View {
    @EnvironmentObject var navigator: NavigationsMessagesController
    @EnvironmentObject var sessionController: SessionController
    
    var body: some View {
        
        VStack(spacing: 0) {
//            ZStack {
//                HStack {
//                    Button(action: navigator.toRoot) {
//                        Image(systemName: "chevron.left")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: Size.w(20), height: Size.w(20))
//                            .foregroundColor(.yellow300)
//                    }
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                HStack {
//                    Text("리스트")
//                }
//                .font(bold20Font)
//                .foregroundColor(.yellow300)
//                .frame(maxWidth: .infinity, alignment: .center)
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: 44)
//            .padding(.horizontal, Size.w(22))
            
            ScrollView(showsIndicators: false) {
                
                if !sessionController.likeListEnabled {
                    VStack {
                        Text("오늘밤,\n리스트 보기를 활성화해보세요.\n누가 먼저 ‘좋아요’를 보냈는지 알려드릴게요!")
                            .font(semiBold16Font)
                            .foregroundColor(.black)
                            .lineSpacing(6)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, Size.w(5))
                        Button(action: {
                            sessionController.openPurchase(purchaseType: .list)
                        }) {
                            Text("구매하기")
                                .font(semiBold16Font)
                                .foregroundColor(.yellow200)
                                .padding(.vertical, Size.w(12))
                                .padding(.horizontal, Size.w(22))
                                .background(Color.gray1000)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.vertical, Size.w(15))
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: likeGradient, startPoint: .topTrailing, endPoint: .bottomLeading))
                    .padding(.top, Size.w(16))
                    
                }
                
                VStack {
                    let columns: [GridItem] = [
                        GridItem(.flexible(), spacing: Size.w(20)),
                        GridItem(.flexible(), spacing: Size.w(20))
                    ]
                    
                    LazyVGrid(columns: columns, spacing: Size.w(20), pinnedViews: [.sectionHeaders]) {
                        Section(header:
                                    HStack {
                            Text("메시지")
                            Text("(\(navigator.reactions.count))")
                        }
                            .font(medium18Font)
                            .foregroundColor(.yellow300)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                            .padding(.top, Size.w(10))
                            .background(Color.gray1000)
                                
                        ) {
                            ForEach(navigator.reactions, id: \.self) { reaction in
                                let user = Dummy.users.first(where: { $0.id == reaction.byUserId })
                                let url = Dummy.users.first(where: { $0.id == reaction.byUserId })?.pictures?.first ?? ""
                                ZStack(alignment: .bottom) {
                                    AsyncImage(url: URL(string: url), content: { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .blur(radius: sessionController.likeListEnabled ? 0 : 10)
                                    }, placeholder: {
                                        ZStack {
                                            Color.gray1000
                                            ProgressView().tint(.white)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(minHeight: Size.w(200), alignment: .center)
                                    })
                                    
                                    if sessionController.likeListEnabled {
                                        VStack(alignment: .leading, spacing: Size.w(3)) {
                                            HStack {
                                                //                                            Text(LocalizedStringKey(user?.gender ?? ""))
                                                //                                                .font(semiBold12Font)
                                                //                                                .foregroundColor(.white)
                                                //                                                .padding(.horizontal, Size.w(12))
                                                //                                                .padding(.vertical, Size.w(6))
                                                //                                                .background(Capsule().fill(Color.gray1000))
                                                
                                                Text(user?.age.description ?? "" + "세")
                                                    .font(semiBold12Font)
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal, Size.w(8))
                                                    .padding(.vertical, Size.w(4))
                                                    .background(Capsule().fill(Color.gray1000))
                                                
                                                Text("테이블")
                                                    .font(semiBold12Font)
                                                    .foregroundColor(.black)
                                                    .padding(.horizontal, Size.w(8))
                                                    .padding(.vertical, Size.w(4))
                                                    .background(Capsule().fill(Color.green200))
                                            }.frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            HStack {
                                                Text(user?.name ?? "")
                                                    .font(medium17Font)
                                                    .foregroundColor(.white)
                                                Circle().fill()
                                                    .foregroundColor(user?.isOnline ?? false ? .green300 : .red400)
                                                    .frame(width: Size.w(6), height: Size.w(6))
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal, Size.w(10))
                                        .padding(.top, Size.w(8))
                                        .padding(.bottom, Size.w(10))
                                        .background(.ultraThinMaterial)
                                        
                                    }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                    }
                    
                    Spacer().frame(height: Size.w(100))
                }
                .padding(.horizontal, Size.w(22))
            }
        }
        .background(Color.gray1000)
//        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("리스트")
                    .font(medium20Font)
                    .foregroundColor(.yellow300)
            }
        }
        .navigationBarItems(leading:
            Button(action: navigator.toRoot) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Size.w(20), height: Size.w(20))
                    .foregroundColor(.yellow300)
            }
        )
    }
}

#Preview {
    PeopleLikesView()
}