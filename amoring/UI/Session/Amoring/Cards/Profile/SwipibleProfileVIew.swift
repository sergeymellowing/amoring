//
//  SwipibleProfileVIew.swift
//  amoring
//
//  Created by 이준녕 on 12/5/23.
//

import SwiftUI

enum SwipeAction{
    case swipeLeft, swipeRight, doNothing
}

struct SwipibleProfileVIew: View {
    @EnvironmentObject var navigator: NavigationAmoringController
    @Namespace var animation
    let user: User
    @State private var dragOffset = CGSize.zero
    @Binding var swipeAction: SwipeAction
    @State private var fitInScreen = false
    @State private var scrollOffset: CGFloat = 0
    @State private var showButtons: Bool = false
    
    var onSwiped: (User, Bool) -> ()
    
    private let nope = "NOPE"
    private let like = "LIKE"
    private let screenWidthLimit = UIScreen.main.bounds.width * 0.5
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
//                ScrollView(showsIndicators: false) {
                TrackableScrollView(showIndicators: false, contentOffset: $scrollOffset) {
                    VStack(spacing: 0) {
                        ProfileCardView(user: user, 
                                        width: reader.size.width - Size.w(navigator.showDetails ? 20 : 44),
                                        height: reader.size.height - (Size.w(75 + (navigator.hidePanel ? 0 : 56)))
                        )
                        ZStack {
                            Color.yellow350
                            VStack {
                                ForEach(0..<20) {
                                    Text("ITEM \($0)")
                                        .foregroundColor(.white)
                                        .padding(.bottom, 40)
                                }
                            }
                        }
                    }
                    .frame(
                        maxWidth: reader.size.width - Size.w(navigator.showDetails ? 20 : 44),
                        /// bottom bar + 56paddiing + 44navbar + saveAreaBottom
                        maxHeight: navigator.showDetails ? .infinity : reader.size.height - (Size.w(75 + 56)), alignment: .top)
                    .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                    /// bottom bar + 56paddiing
                    .padding(.bottom, navigator.showDetails ? Size.w(75 + 56) : 0)
                    .frame(maxWidth: reader.size.width)
                    .background(GeometryReader {
                        // calculate height by consumed background and store in
                        // view preference
                        Color.clear.preference(key: ViewHeightKey.self,
                                               value: $0.frame(in: .local).size.height) })
                }
                .onPreferenceChange(ViewHeightKey.self) {
                    self.fitInScreen = $0 < reader.size.height    // << here !!
                }
                .disabled(self.fitInScreen)
                .onChange(of: scrollOffset) { offset in
                    if offset > Size.w(800) {
                        if !showButtons {
                            withAnimation {
                                showButtons = true
                            }
                        }
                    } else {
                        if showButtons {
                            withAnimation {
                                showButtons = false
                            }
                        }
                    }
                }
            }
            .onTapGesture {
                withAnimation {
                    navigator.hidePanel.toggle()
                }
                withAnimation(.smooth) {
                    navigator.showDetails.toggle()
                }
            }
           
            .overlay(
                HStack{
                    Text(like)
                        .font(bold38Font)
                        .foregroundGradient(colors: [Color.yellow500, Color.yellow200])
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(LinearGradient(gradient: .init(colors: [Color.yellow200, Color.yellow500]),
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing), lineWidth: 5)
                        )
                        .rotationEffect(.degrees(-30))
                        .opacity(getLikeOpacity())
                    
                    Spacer()
                    
                    Text(nope)
                        .font(bold38Font)
                        .foregroundGradient(colors: [Color.red500, Color.red200])
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(LinearGradient(gradient: .init(colors: [Color.red200, Color.red500]),
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing), lineWidth: 5)
                        )
                        .rotationEffect(.degrees(30))
                        .opacity(getDislikeOpacity())
                }
                    .padding(.top, Size.w(45))
                    .padding(.horizontal, Size.w(45))
                ,alignment: .top)
            .offset(x: self.dragOffset.width,y: self.dragOffset.height)
            .rotationEffect(.degrees(self.dragOffset.width * 0.06), anchor: .center)
            .simultaneousGesture(DragGesture(minimumDistance: 10).onChanged{ value in
                if !navigator.showDetails {
                    self.dragOffset = value.translation
                }
                
            }.onEnded{ value in
                if !navigator.showDetails {
                    performDragEnd(value.translation)
                    print("onEnd: \(value.location)")
                }
            }).onChange(of: swipeAction, perform: { newValue in
                if !navigator.showDetails {
                    if newValue != .doNothing {
                        performSwipe(newValue)
                    }
                }
            })
            if !navigator.showDetails || showButtons {
                LikeDisLikeButtons(swipeAction: $swipeAction)
                    .transition(.move(edge: .bottom))
            }
            
        }.frame(alignment: .bottom)
    }
    
    
    private func performSwipe(_ swipeAction: SwipeAction){
        withAnimation(.linear(duration: 0.3)){
            if(swipeAction == .swipeRight){
                self.dragOffset.width += screenWidthLimit * 2
            } else if(swipeAction == .swipeLeft){
                self.dragOffset.width -= screenWidthLimit * 2
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onSwiped(user, swipeAction == .swipeRight)
        }
        self.swipeAction = .doNothing
    }
    
    private func performDragEnd(_ translation: CGSize){
        let translationX = translation.width
        if (hasLiked(translationX)) {
            withAnimation(.linear(duration: 0.3)){
                self.dragOffset = translation
                self.dragOffset.width += screenWidthLimit
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                onSwiped(user, true)
            }
        } else if(hasDisliked(translationX)){
            withAnimation(.linear(duration: 0.3)){
                self.dragOffset = translation
                self.dragOffset.width -= screenWidthLimit
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                onSwiped(user, false)
            }
        } else{
            withAnimation(.default){
                self.dragOffset = .zero
            }
        }
    }
    
    private func hasLiked(_ value: Double) -> Bool {
        let ratio: Double = dragOffset.width / screenWidthLimit
        return ratio >= 1
    }
    
    private func hasDisliked(_ value: Double) -> Bool {
        let ratio: Double = -dragOffset.width / screenWidthLimit
        return ratio >= 1
    }
    
    private func getLikeOpacity() -> Double{
        let ratio: Double = dragOffset.width / screenWidthLimit;
        if(ratio >= 1){
            return 1.0
        } else if(ratio <= 0){
            return 0.0
        } else {
            return ratio
        }
    }
    
    private func getDislikeOpacity() -> Double{
        let ratio: Double = -dragOffset.width / screenWidthLimit;
        if(ratio >= 1){
            return 1.0
        } else if(ratio <= 0){
            return 0.0
        } else {
            return ratio
        }
    }
}

#Preview {
    SwipibleProfileVIew(user: Dummy.users.first!, swipeAction: .constant(.doNothing), onSwiped: { _,_  in })
}
