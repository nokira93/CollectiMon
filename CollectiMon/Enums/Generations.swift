//
//  Generations.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 29/03/2024.
//

import Foundation

enum Generations: String, CaseIterable {
    case Kanto = "Kanto"
    case Johto = "Johto"
    case Hoenn = "Hoenn"
    case Sinnoh = "Sinnoh"
    case Unova = "Unova"
    case Kalos = "Kalos"
    case Alola = "Alola"
    case Galar = "Galar"
    case Paldea = "Paldea"
    
    static var allCases: [Generations] {
        return [.Kanto, .Johto, .Hoenn, .Sinnoh, .Unova, .Kalos, .Alola, .Galar, .Paldea]
    }
}

extension Generations {
    func getNum() -> Int {
        switch self{
        case .Kanto:
            return 151
        case .Johto:
            return 100
        case .Hoenn:
            return 135
        case .Sinnoh:
            return 107
        case .Unova:
            return 156
        case .Kalos:
            return 72
        case .Alola:
            return 88
        case .Galar:
            return 96
        case .Paldea:
            return 120
        }
    }
}
extension Generations {
    func pokemonsFrom() -> Int {
        switch self{
        case .Kanto:
            return 1
        case .Johto:
            return 152
        case .Hoenn:
            return 252
        case .Sinnoh:
            return 387
        case .Unova:
            return 494
        case .Kalos:
            return 650
        case .Alola:
            return 722
        case .Galar:
            return 810
        case .Paldea:
            return 858
//            return 906
        }
    }
    
    func pokemonsTo() -> Int {
        switch self{
        case .Kanto:
            return 151
        case .Johto:
            return 251
        case .Hoenn:
            return 386
        case .Sinnoh:
            return 493
        case .Unova:
            return 649
        case .Kalos:
            return 721
        case .Alola:
            return 809
        case .Galar:
            return 858
//            return 905
        case .Paldea:
            return 858
//            return 1025
        }
    }
}
