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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Sets.totalCards, ascending: true)])
    var series: FetchedResults<Sets>
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Scarlet & Violet")
                    .font(.title3)
                    .bold()
                
                ForEach(series) { set in
                    NavigationLink(destination: SetsDetailView(vm: SetsDetailViewModel(setID: set.setID ?? ""))) {
                        ExtensionCellView(setData: PokemonSets(printedTotal: Int(set.basicCards), total: Int(set.totalCards), name: series.first?.name ?? "", id: set.setID ?? "", series: set.series ?? "", ptcgoCode: set.code ?? "", images: PokemonSetsImages(symbol: set.symbol ?? "", logo: set.logo ?? "")))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
    }
}

#Preview {
    ExtensionView(vm: ExtensionViewModel())
}
