//
//  FolderIconView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 29/04/2024.
//

import SwiftUI

struct FolderIconView: View {
    var progress: Int
    var total: Int
    var name: String
    
    var body: some View {
        HStack() {
            Image("mewTwoIcon")
            VStack(alignment: .leading) {
                Text(name)
                    .bold()
                    .font(.title)
                
                    ProgressView("\(progress) of \(total)", value: Double(progress), total: Double(total))
                    .frame(height: 20)
                    .padding(.horizontal, 10)

//                }
            }
        }
    }
}

#Preview {
    FolderIconView(progress: 3, total: 10, name: "Wishlist")
}
