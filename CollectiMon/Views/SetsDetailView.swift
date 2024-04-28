//
//  SetsDetailView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 27/04/2024.
//

import SwiftUI

struct SetsDetailView: View {
    @StateObject var vm: SetsDetailViewModel
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Card.nationalPokedexNumbers, ascending: true)])
    var card: FetchedResults<Card>
    
    var body: some View {
        Text("Test \(card.count)")
    }
}

//#Preview {
//    SetsDetailView(vm: <#LoadingViewModel#>)
//}
