//
//  PokemonCardModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 25/04/2024.
//

import Foundation

struct PokemonCardResults: Codable {
    let data: [PokemonCardModel]
}

struct PokemonCardModel: Codable {
    let name: String
    let number: Int
    //dodac enuma
    let rarity: String
    let nationalPokedexNumbers: Int
    let images: CardImagesModel
    let id: String
    //dodac enuma
    let supertype: String
    let tcgplayer: TcgplayerModel
}

struct CardImagesModel: Codable {
    let small: String
    let large: String
}

struct TcgplayerModel: Codable {
    let url: String
    let updatedAt: String
    let prices: PricesModel
}

struct PricesModel: Codable {
    let reverseHolofoil: String?
    let normal: String?
    let holofoil: String?
}

//https://api.pokemontcg.io/v2/cards?page=2&q=set.id:sv4
//https://api.pokemontcg.io/v2/sets?pageSize=250
//
//
//https://api.pokemontcg.io/v2/cards?page=2&q=set.id:sv4
