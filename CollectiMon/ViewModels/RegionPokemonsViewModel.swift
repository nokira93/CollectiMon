//
//  RegionPokemonsViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import Foundation
import SwiftUI
import CoreData

class RegionPokemonsViewModel: ObservableObject {
    let regionName: String
    let totalNumber: Int
    let pokemonCaught: Int
   @Published var pokemonsArr: [PokemonInfoModel] = []
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(regionName: String, totalNumber: Int, pokemonCaught: Int) {
        self.regionName = regionName
        self.totalNumber = totalNumber
        self.pokemonCaught = pokemonCaught

//        let caught = poke.filter{ $0.caught }
//        self.pokemonCaught = caught.count
        
    }
}
