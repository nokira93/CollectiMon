//
//  PokemonSets.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 24/04/2024.
//

import Foundation


struct SeriesResults: Codable {
    let data: [PokemonSets]
}


struct PokemonSets: Codable {
    let printedTotal: Int
    let total: Int
    let name: String
    let series: String
    let ptcgoCode: String
    let images: PokemonSetsImages
}

struct PokemonSetsImages: Codable {
    let symbol: String
    let logo: String
}


//https://api.pokemontcg.io/v2/sets/pageSize=250
//https://api.pokemontcg.io/v2/sets/swsh1
//https://api.pokemontcg.io/v2/sets?pageSize=250

//https://api.pokemontcg.io/v2/sets?q=series:Scarlet&Violet
