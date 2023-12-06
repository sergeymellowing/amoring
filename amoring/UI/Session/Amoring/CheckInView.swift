//
//  CheckInView.swift
//  amoring
//
//  Created by 이준녕 on 12/6/23.
//

import SwiftUI
import NavigationStackBackport

struct CheckInView: View {
    @EnvironmentObject var navigator: NavigationAmoringController
    
    @State var torchIsOn = false
    @State var haveTable = false
    @State var resultString: String? = nil
    
    let bottomSpacing = Size.safeArea().bottom + Size.h(18 + 16)
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if let resultString {
                (
                    Text(resultString)
                        .font(extraBold28Font)
                        .foregroundColor(.yellow200)
                    +
                    Text(" 의")
                        .font(regular28Font)
                        .foregroundColor(.yellow300)
                )
                .padding(.top, Size.w(32))
                
                Text("라운지에 체크인 하시겠습니까?")
                    .font(regular16Font)
                    .foregroundColor(.yellow300)
                    .padding(.top, Size.w(12))
                
                Image("channel-lounge-profile")
                    .frame(width: Size.w(90), height: Size.w(90))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14).stroke(Color.yellow700)
                    )
                    .padding(Size.w(40))
                
                HStack {
                    Image(systemName: haveTable ? "checkmark.square" : "square")
                    Text("테이블이 있습니다.")
                    Spacer()
                }
                .foregroundColor(.green200)
                .padding(Size.w(19))
                .background(Color.green100.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.green700)
                )
                .onTapGesture {
                    self.haveTable.toggle()
                }
                
                Spacer()
                
            } else {
                Text("QR코드를 스캔하여 체크인해주세요.")
                    .font(medium16Font)
                    .foregroundColor(.yellow300)
                    .padding(.top, Size.w(16))
                    .padding(.bottom, Size.w(20))
                
                CodeScannerView(codeTypes: [.qr], scanMode: .continuous, isTorchOn: $torchIsOn, completion: handleScan)
                    .border(Color.yellow600)
            }
            
            
            VStack(alignment: .leading, spacing: Size.w(7)) {
                Text("• QR코드는 실시간으로 업데이트 되기때문에 이미지는")
                Text("• 체크인은 2시간 동안 유효합니다.")
                Text("• 대표 주의사항")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(light14Font)
            .foregroundColor(.yellow600)
            .padding(.vertical, Size.w(16))
            
            if let resultString {
                HStack(alignment: .center, spacing: Size.w(22)) {
                    Button(action: {
                        withAnimation {
                            self.resultString = nil
                        }
                    }) {
                        Text("아니요")
                            .font(medium18Font)
                            .foregroundColor(.yellow600)
                            .padding(.vertical, Size.w(16))
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(Color.yellow600)
                            )
                    }
                    
                    Button(action: {
                        withAnimation {
                            navigator.amoring = true
                        }
                    }) {
                        Text("네")
                            .font(medium18Font)
                            .foregroundColor(.gray1000)
                            .padding(.vertical, Size.w(16))
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .padding(.horizontal, Size.w(22))
        .padding(.bottom, bottomSpacing)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray1000)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("AMORING")
                    .font(bold20Font)
                    .foregroundColor(.yellow300)
            }
        }
        .navigationBarItems(trailing:
                                Button(action: {
         
        }) {
            Image("ic-info")
                .resizable()
                .scaledToFit()
                .frame(width: Size.w(32), height: Size.w(32))
        }
        )
        .environmentObject(navigator)
        .backport.navigationDestination(for: AmoringPath.self) { screen in
            navigator.navigate(screen: screen)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let result):
            print(result)
            withAnimation {
                self.resultString = result.string
            }
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
