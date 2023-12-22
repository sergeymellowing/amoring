//
//  TestView.swift
//  amoring
//
//  Created by 이준녕 on 12/22/23.
//

import SwiftUI

struct TestView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Color.red
                .frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
            if show {
                secondView(show: $show)
            }
        }
           
    }
}

struct secondView: View {
    @Binding var show: Bool
    var body: some View {
        Color.green.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
            .transition(.move(edge: .bottom))
            .onTapGesture {
                withAnimation {
                    show.toggle()
                }
            }
    }
}

#Preview {
    TestView()
}
