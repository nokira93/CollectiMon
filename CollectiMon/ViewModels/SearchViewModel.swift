//
//  SearchViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 17/04/2024.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \PokemonInfo.id, ascending: true)]) var poke: FetchedResults<PokemonInfo>

    @Published var searchText = ""
    
    @Published var searchResults: [PokemonInfo] = []
    
    
    
    
    func getResults() {
        if searchText.isEmpty {
            searchResults =  []
        } else {
            searchResults =  poke.filter { $0.name?.contains(searchText) ?? false}
        }
    }
}
