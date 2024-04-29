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
                HStack(){
                    Text("\(progress) of \(total)")
                        .font(.title2)
                    ZStack() {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.gray)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.blue)
                    }
                    .frame(height: 20)
                    .padding(.horizontal, 10)

                }
            }
        }
    }
}

#Preview {
    FolderIconView(progress: 3, total: 10, name: "Wishlist")
}
