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
    var cards: FetchedResults<Card>
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: vm.colums, spacing: 20) {
                ForEach(cards) { card in
                    
                    AsyncImage(
                        url: URL(string: card.imageSmall ?? ""),
                        content: { image in
                            image.resizable()
                                .scaledToFit()
//                                .frame(maxWidth: 40, maxHeight: 40)
                        },
                        placeholder: {
                            ProgressView()
                        }
                        )
                    
                }
            }.padding(.horizontal, 5)
        }
    }
}

//#Preview {
//    SetsDetailView(vm: <#LoadingViewModel#>)
//}
