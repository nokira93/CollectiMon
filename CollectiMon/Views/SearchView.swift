//
//  SearchView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 17/04/2024.
//

import SwiftUI

struct SearchView: View {

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \PokemonInfo.id, ascending: true)]) var poke: FetchedResults<PokemonInfo>
    
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { pok in
//                    NavigationLink {
                        Text(":D")
//                    } label: {
//                        Text(name)
//                    }
                }
            }
        }
        .searchable(text: $searchText)
    }

    var searchResults: [PokemonInfo] {
        if searchText.isEmpty {
            return []
        } else {
            return poke.filter { $0.name?.contains(searchText) ?? false}
        }
    }
}

#Preview {
    SearchView()
}
