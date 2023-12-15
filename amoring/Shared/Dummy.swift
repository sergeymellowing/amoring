//
//  Dummy.swift
//  amoring
//
//  Created by 이준녕 on 12/15/23.
//

import Foundation

class Dummy {
    static let users = [
        User(
            id: "1",
            name: "Eugene Krabs",
            birthDate: "2000-08-08".toDate(),
            bio: "저희 3명이고, 테이블 잡음, 술 있음",
            gender: "FEMALE",
            pictures: [
                "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-1.png?alt=media&token=426686d7-5cc7-4c9d-9de8-6a87c0f28a7b",
                "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
                "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
                "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-4.png?alt=media&token=144e3abe-d17f-4fa6-9a7c-8670ad3157db"
            ],
            fakeImage: "person-0",
            interests: [
                Constants.sport[1],
                Constants.sport[4],
                Constants.sport[7],
                Constants.sport[2],
                Constants.sport[0],
                Constants.interests[0],
            ],
            height: 176.8,
            weight: 78.5,
            mbti: .INFP,
            cat: "학사/박사",
            cat2: "사무직"
        ),
        User(id: "2", name: "SpongeBob SquarePants", birthDate: "2001-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "MALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-1.jpeg?alt=media&token=06896c71-dabf-4262-8948-77015fab150e",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
            
        ], fakeImage: "person-1", interests: []),
        User(id: "3", name: "Patric Star", birthDate: "1999-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "FEMALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-2.jpeg?alt=media&token=5f6f4728-0ddc-4f9d-9991-7b3cb31deff2",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
        ], fakeImage: "person-2", interests: []),
        User(id: "4", name: "Squidward", birthDate: "1998-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "MALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-3.jpeg?alt=media&token=f4910ba0-2842-4b13-a8ed-38a9c098e63c",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
        ], fakeImage: "person-3", interests: []),
        User(id: "5", name: "Sandy Cheeks", birthDate: "1997-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "FEMALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-4.jpeg?alt=media&token=354eecdc-be34-4a26-b7f8-2aff6e5342fb",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
        ], fakeImage: "person-4", interests: []),
        User(id: "6", name: "Eugene Krabs", birthDate: "2000-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "FEMALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-1.png?alt=media&token=426686d7-5cc7-4c9d-9de8-6a87c0f28a7b",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-4.png?alt=media&token=144e3abe-d17f-4fa6-9a7c-8670ad3157db"
        ], fakeImage: "person-0",
             interests: [
                 Constants.sport[1],
                 Constants.sport[4],
                 Constants.sport[7],
                 Constants.sport[2],
                 Constants.sport[0],
                 Constants.interests[0],
             ],
             height: 176.8,
             weight: 78.5,
             mbti: .INFP,
             cat: "학사/박사",
             cat2: "사무직"
            )
    ]
}
