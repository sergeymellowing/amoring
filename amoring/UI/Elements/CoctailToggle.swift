//
//  CoctailToggle.swift
//  amoring
//
//  Created by 이준녕 on 11/30/23.
//

import SwiftUI

struct CoctailToggle: View {
    @Binding var isOn: Bool
//    @State var isOn: Bool = false
    
    var body: some View {
        ZStack(alignment: isOn ? .trailing : .leading) {
            isOn ?
            LinearGradient(colors: toggleGradient, startPoint: .topTrailing, endPoint: .bottomLeading) :
            LinearGradient(colors: [Color.gray700], startPoint: .topTrailing, endPoint: .bottomLeading)
            
            ZStack {
                Color.gray900
                Image(isOn ? "ic-heart-empty-rotated" : "ic-coctail")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.yellow200)
                    .rotationEffect(.degrees(isOn ? 180 : 0))
                    .frame(width: isOn ? 15 : 12, height: isOn ? 13 : 14)
            }
            .frame(width: 30, height: 30)
            .cornerRadius(18)
            .padding(.horizontal, 1)
        }
        .frame(width: 62, height: 32)
        .cornerRadius(18)
        .onTapGesture {
            withAnimation {
                isOn.toggle()
            }
        }
    }
}

#Preview {
    VStack {
//        CoctailToggle()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray1000)
}
