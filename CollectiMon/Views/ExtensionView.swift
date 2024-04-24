//
//  ExtensionView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 24/04/2024.
//

import SwiftUI

struct ExtensionView: View {
    
    @StateObject var vm: ExtensionViewModel
    @Environment(\.managedObjectContext) var managedObject
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Sets.totalCards, ascending: true)]) var poke: FetchedResults<Sets>
    
    var body: some View {
        ScrollView {
                Text("Scarlet & Violet")
                    .font(.title3)
                    .bold()
            
            
        }
    }
}

#Preview {
    ExtensionView(vm: ExtensionViewModel())
}
