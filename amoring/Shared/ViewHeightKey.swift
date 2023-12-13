//
//  ViewHeightKey.swift
//  amoring
//
//  Created by 이준녕 on 12/13/23.
//

import SwiftUI

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = value + nextValue()
    }
}
