//
//  PurchaseModel.swift
//  amoring
//
//  Created by 이준녕 on 12/15/23.
//

import Foundation

struct PurchaseModel {
    enum type: Int {
        case like = 0
        case lounge
        case transparent
        case list
    }
    
    let barTitle: String
    let title: String
    var titleImage: String?
    let subtitle: String
    let description: String
    let description2: String
    var description3: String?
    var description4: String?
    let type: type
}
