//
//  DexView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI

struct DexView: View {
    var body: some View {
        VStack(){
            Text("xD")
                .onTapGesture {
                    CoreDataManager.shared.saveContext()
                }
//            Button(action: test) {
//                Label("Add Folder", systemImage: "folder.badge.plus")
//            }
        }
    }
}

struct DexView_Previews: PreviewProvider {
    static var previews: some View {
        DexView()
    }
}
