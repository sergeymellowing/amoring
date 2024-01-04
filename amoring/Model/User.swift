//
//  User.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import Foundation

public struct User: Codable, Equatable, Hashable {
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: Int
    var name: String?
//    var birthDate: Date?
    var birthYear: Int?
    var bio: String?
    var gender: String?
    var pictures: [String]?
    var liked: [String]?
    var passed: [String]?
    var terms: Bool?
    var fakeImage: String?
    var interests: [Interest]
    var height: Double?
    var weight: Double?
    var mbti: mbtiE?
    
    var job: String?
    var education: String?
    var isOnline: Bool?
    
    //TODO: fix it
    var age: Int? {
        let year = (Int(Calendar.current.component(.year, from: Date()).description) ?? 2024)
        if let birthYear {
            return year - birthYear
        } else {
            return nil
        }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthYear
        case bio
        case gender
        case pictures
        case liked
        case passed
        case terms
        case fakeImage
        case interests
        case height
        case weight
        case mbti
        case job
        case education
        case isOnline
    }
}
