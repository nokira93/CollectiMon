//
//  ScannerView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 14/04/2024.
//

import SwiftUI

struct ScannerView: View {
    let vm: ScannerViewModel
    @State var isShowingScanner = false

    var body: some View {
//        NavigationView {
        VStack(){
            Rectangle()
//                .frame(maxWidth: .infinity, maxHeight: 300)
            Spacer()
                .frame(height: 30)
//            Label("Scanned Pokemon", Image: "pikachu")

            Label {
                Text("Please scan card")
                    .foregroundStyle(.primary)
                    .font(.title)
                    .padding()

            } icon: {
                Image("pikachu2")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .padding()
                    .background(.clear)
                    .onTapGesture {
                        isShowingScanner = true
                    }
                    
            }
            
            Text("Not Yet Scanned")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding(.bottom, 20)
        }
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
        }
//        }
//        .navigationTitle("Scanner")
    }
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
       // more code to come
    }
}


struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(vm: ScannerViewModel())
    }
}
