//
//  Dummy.swift
//  amoring
//
//  Created by 이준녕 on 12/15/23.
//

import Foundation

class Dummy {
    static let reactions = [
        Reaction(byUserId: 3, toUserId: 0, like: true),
        Reaction(byUserId: 4, toUserId: 0, like: true),
        Reaction(byUserId: 5, toUserId: 0, like: true),
    ]
    
    static let conversations = [
        Conversation(
            id: 1,
            participants: [users.first!, users[1]],
            messages: [
                Message(id: 1, body: "기온이 영하 13도까지 떨어진 18일 오전 10시 30분. 서울 종로구 국립고궁박물관 방면 쪽문으로 박물관 직원이 따뜻한 보리차를 담은 보온병을 내왔다. 쪽문 양옆으로 약 38.1m 길이로 가림막과 펜스가 둘러져 있어 사람들의 접근을 막았다. 작은 틈새로 새어 나오는 '뚝딱뚝딱' 하는 마찰음만이 이곳이 '낙서 테러'를 당한 경복궁 담장 복원 작업 현장임을 일러주었다.", sender: users[1], senderId: users[1].id, recipients: [], createdAt: Date(), updatedAt: Date()),
                Message(id: 2, body: "가림막 뒤에선 국립고궁박물관, 국립문화재연구원 문화재보존과학센터, 문화재청 궁능유적본부, 경복궁 관리소 보수정비단의 직원 10명이 담장에 스프레이로 휘갈겨 쓴 낙서를 지우기 위해 고군분투 중이었다. 16일 새벽과 17일 밤에 발생한 '낙서 테러'로 국립중앙박물관 직원들을 포함해 전국의 문화유산 보존처리 전문가들이 경복궁으로 집결한 터였다. 문화재청 관계자는 '40명 정도가 교대로 근무할 예정 이라며 (모방범죄에 따른) 17일 2차 낙서 때문에 (지우는 데) 일주일 이상의 시간이 걸릴 것 이라고 말했다.", sender: users[0], senderId: users[0].id, recipients: [], createdAt: Date(), updatedAt: Date()),
                Message(id: 3, body: "문화재 복원 작업을 할 때는 추가 훼손을 막기 위해 최적의 방법을 결정하는 것이 중요하다. 이에 오염물 성분 분석 결과와 문화재의 재질·종류 등을 고려해 샘플 테스트를 먼저 하고 복원 작업에 적용하는 것이 일반적이다. 예컨대 2007년 서울 송파구 삼전동의 '삼전도비'가 붉은 스프레이로 오염됐을 당시 국립문화재연구소는 다양한 테스트를 거친 끝에 3개월 걸려 복구 작업을 마쳤다.", sender: users[1], senderId: users[1].id, recipients: [], createdAt: Date(), updatedAt: Date()),
                Message(id: 4, body: "이번 경복궁 담장 복원팀은 이 같은 통상적 방식을 쓰지 못한 채 현장에서 시험한 방식을 즉석에서 적용하고 있다. 맹추위 때문이다. 복구 전문가들은 (화학약품을 걷어내기 위해) 아무리 스팀을 쏴도 바로 얼어버린다 고 성토했다. 시간이 지체될수록 스프레이 잉크가 담장 깊숙이 스며드는 만큼 날이 풀리기를 기다릴 수도 없다.", sender: users[0], senderId: users[0].id, recipients: [], createdAt: Date(), updatedAt: Date()),
            ], createdAt: Date(), archivedAt: Date(), updatedAt: Date()),
        
        Conversation(
            id: 2,
            participants: [users.first!, users[2]],
            messages: [
                Message(id: 1, body: "아, 네 저희도 지금 같이 있어요 ㅎㅎ 지금 어디 계세요?", sender: users[2], senderId: users[2].id, recipients: [], createdAt: Date(), updatedAt: Date())
            ], createdAt: Date(), archivedAt: Date(), updatedAt: Date())
    ]
    
    static let users = [
        User(
            id: 1,
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
        User(id: 2, name: "SpongeBob SquarePants", birthDate: "2001-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "MALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-1.jpeg?alt=media&token=06896c71-dabf-4262-8948-77015fab150e",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
            
        ], fakeImage: "person-1", interests: [], isOnline: true),
        User(id: 3, name: "Patric Star", birthDate: "1999-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "FEMALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-2.jpeg?alt=media&token=5f6f4728-0ddc-4f9d-9991-7b3cb31deff2",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
        ], fakeImage: "person-2", interests: []),
        User(id: 4, name: "Squidward", birthDate: "1998-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "MALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-3.jpeg?alt=media&token=f4910ba0-2842-4b13-a8ed-38a9c098e63c",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
        ], fakeImage: "person-3", interests: []),
        User(id: 5, name: "Sandy Cheeks", birthDate: "1997-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "FEMALE", pictures: [
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/person-4.jpeg?alt=media&token=354eecdc-be34-4a26-b7f8-2aff6e5342fb",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-2.png?alt=media&token=52de63e4-cc28-40b3-b987-04c3a80b3fc9",
            "https://firebasestorage.googleapis.com/v0/b/tinderdemo-497b9.appspot.com/o/dummyUser-3.png?alt=media&token=c8d56ce7-f636-4942-a939-91367052480e",
        ], fakeImage: "person-4", interests: []),
        User(id: 6, name: "Eugene Krabs", birthDate: "2000-08-08".toDate(), bio: "저희 3명이고, 테이블 잡음, 술 있음", gender: "FEMALE", pictures: [
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
