//
//  PokemonCardModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 25/04/2024.
//

import Foundation

struct PokemonCardResults: Codable {
    let data: [PokemonCardModel]
    let page: Int
    let count: Int
    let totalCount: Int
    let pageSize: Int
}

struct PokemonCardModel: Codable {
    let name: String
    let number: String
    //dodac enuma
    let rarity: String
    let nationalPokedexNumbers: [Int]
    let images: CardImagesModel
    let id: String
//    dodac enuma
    let supertype: String
    let tcgplayer: TcgplayerModel
}

struct CardImagesModel: Codable {
    let small: String
    let large: String
}

struct TcgplayerModel: Codable {
    let url: URL
    let updatedAt: String
//    let prices: PricesModel
}

struct PricesModel: Codable {
    let reverseHolofoil: Int?
    let normal: Int?
    let holofoil: Int?
}
