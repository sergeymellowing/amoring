//
//  PurchaseView.swift
//  amoring
//
//  Created by 이준녕 on 12/15/23.
//

import SwiftUI

struct PurchaseView: View {
    let barTitle: String = "좋아요"
    let title: String = "❤ + 좋아요"
    let subtitle: String = "더 많은 좋아요로\n더 많은 인연을 만드세요"
    let description: String = "좋아요가 부족해 아쉬운 순간이 있었나요?\n좋아요를 더 추가해 사용해보세요."
    let description2: String = "이 특별한 좋아요는 하루가 지나도 사라지지 않으니\n중요한 순간을 위해서 미리 준비하세요!"
    var description3: String? = "구매 시 유의사항"
    var description4: String? = "• 결제 확정 시 귀하의 iTunes 계정에 요금이 청구됩니다.\n• 패스는 구입 시 자동으로 활성화 되며, 다음날 오후 12:00까지 유효합니다.\n• 패스가 활성화 된 기간 동안에는 중복구매 할 수 없습니다.\n• 패스의 잔여시간은 아모링 앱 > 내 계정 > 아모링 구매내역에서 확인이 가능합니다."
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button(action: {
                        // close purchaseView
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Size.w(16), height: Size.w(16))
                            .foregroundColor(.yellow300)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text(barTitle)
                        .font(bold20Font)
                        .foregroundColor(.yellow300)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .padding(.horizontal, Size.w(22))
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Text(title)
                            .font(medium20Font)
                            .foregroundColor(.yellow200)
                            .padding(.horizontal, Size.w(18))
                            .padding(.vertical, Size.w(10))
                            .background(Color.gray1000)
                            .clipShape(Capsule())
                            .padding(.top, Size.w(40))
                        
                        Text(subtitle)
                            .font(bold26Font)
                            .lineSpacing(5)
                            .multilineTextAlignment(.center)
                            .padding(.top, Size.w(30))
                        
                        Text(description)
                            .font(medium16Font)
                            .lineSpacing(7)
                            .multilineTextAlignment(.center)
                            .padding(.top, Size.w(16))
                        
                        PurchaseWindow()
                            .padding(.top, Size.w(36))
                        
                        Text(description2)
                            .font(medium16Font)
                            .lineSpacing(7)
                            .multilineTextAlignment(.center)
                            .padding(.top, Size.w(40))
                        
                        if let description3 {
                            Text(description3)
                                .font(bold16Font)
                                .multilineTextAlignment(.center)
                                .padding(.top, Size.w(24))
                        }
                        if let description4 {
                            Text(description4)
                                .font(regular14Font)
                                .lineSpacing(8)
                                .multilineTextAlignment(.leading)
                                .padding(.top, Size.w(24))
                        }
                        
                        Spacer().frame(height: 100)
                    }
                    .padding(.horizontal, Size.w(13))
                }
                .frame(maxWidth: .infinity)
                .background(LinearGradient(colors: likeGradient, startPoint: .topTrailing, endPoint: .bottomLeading))
             
                
                Button(action: {
                    // buy and close
                }) {
                    Text("구매하기")
                        .font(semiBold22Font)
                        .foregroundColor(.yellow200)
                        .padding(.vertical, Size.w(22))
                        .frame(maxWidth: .infinity)
                }
                .background(Color.black)
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, Size.w(10))
            .padding(.top, Size.w(16))
        }
        .background(Color.gray1000)
    }
        
    @ViewBuilder
    private func PurchaseWindow() -> some View {
        Text("W 15,000")
            .frame(height: 240, alignment: .center)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, Size.w(19))
    }
}

#Preview {
    PurchaseView()
}
