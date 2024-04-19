//
//  PokemonBasicInfo.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import Foundation

struct PokemonBasicInfo: Codable {
    let name: String
    let sprites: PokemonBasicInfoSprites
    let types: [PokemonBasicInfoTypes]
}

struct PokemonBasicInfoSprites: Codable {
    var back_default:String?
//    var back_female:String?
//    var back_shiny:String
//    var back_shiny_female:String?
    var front_default: String
//    var front_female:String?
//    var front_shiny:String
//    var front_shiny_female:String?
}

struct PokemonBasicInfoTypes: Codable {
    var type:PokemonType

}

struct PokemonType: Codable {
    var name: String
}
