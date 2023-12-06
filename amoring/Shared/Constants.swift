//
//  Constants.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import Foundation

class Constants {
    static let genderOptions = ["male", "female"]
}

class Dummy {
    static let users = [
        User(id: "1", name: "Eugene Krabs", birthDate: "2000-08-08".toDate(), bio: "Some short info about me", gender: "female", fakeImage: "person-0"),
        User(id: "2", name: "SpongeBob SquarePants", birthDate: "2001-08-08".toDate(), bio: "Some short info about me", gender: "male", fakeImage: "person-1"),
        User(id: "3", name: "Patric Star", birthDate: "1999-08-08".toDate(), bio: "Some short info about me", gender: "female", fakeImage: "person-2"),
        User(id: "4", name: "Squidward", birthDate: "1998-08-08".toDate(), bio: "Some short info about me", gender: "male", fakeImage: "person-3"),
        User(id: "5", name: "Sandy Cheeks", birthDate: "1997-08-08".toDate(), bio: "Some short info about me", gender: "female", fakeImage: "person-4"),
    ]
}
