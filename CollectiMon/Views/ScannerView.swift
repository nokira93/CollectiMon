//
//  ScannerView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 14/04/2024.
//

import SwiftUI

struct ScannerView: View {
    @StateObject var vm: ScannerViewModel

    var body: some View {
//        NavigationView {
        VStack(){
//            Rectangle()
            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: vm.handleScan)
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
                    
            }
            
            Text("Not Yet Scanned")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding(.bottom, 20)
        }
    }
}


struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(vm: ScannerViewModel())
    }
}
