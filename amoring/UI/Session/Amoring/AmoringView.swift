//
//  AmoringView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct AmoringView: View {
    var body: some View {
        VStack {
            Text("AMORING")
                .font(bold20Font)
                .foregroundColor(.yellow300)
            
        }
        .padding(.top, 10)
        .padding(.horizontal, 22)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.gray1000)
    }
}

#Preview {
    AmoringView()
}
