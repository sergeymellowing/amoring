//
//  AddedImageView.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct AddedImageView: View {
    @State private var isTapped: Bool = false
    let image: UIImage
    let action: () -> ()
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Image(uiImage: image)
                .centerCropped()
                .frame(maxWidth: .infinity)
                .aspectRatio(0.6, contentMode: .fit)
//                .background(AppColor.lightGray)
                .cornerRadius(8)
            Image(systemName: "multiply.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .background(Capsule().fill(LinearGradient(colors: [Color("e83984"), Color("f47d55")], startPoint: .leading, endPoint: .trailing)))
//                .background(Capsule().fill(LinearGradient(colors: AppColor.appColors, startPoint: .leading, endPoint: .trailing)))
                .foregroundColor(.white)
                .offset(x: 8, y: 8)
        }
        .opacity(isTapped ? 0.5 : 1)
        .scaleEffect(isTapped ? 0.9 : 1)
        .padding(8)
        .gesture(
            TapGesture()
                .onEnded{ _ in
                    print("on End Tap")
                    withAnimation(Animation.linear(duration: 0.1)){
                        self.isTapped = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.isTapped = false
                        action()
                    }
                })
    }
}

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}

struct AddedImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddedImageView(image: UIImage(named: "jeff_bezos")!){
            
        }
    }
}

