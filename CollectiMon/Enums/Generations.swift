//
//  Generations.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 29/03/2024.
//

import Foundation

enum Generations: String {
    case Kanto = "Kanto"
    case Johto = "Johto"
    case Hoenn = "Hoenn"
    case Sinnoh = "Sinnoh"
    case Unova = "Unova"
    case Kalos = "Kalos"
    case Alola = "Alola"
    case Galar = "Galar"
    case Paldea = "Paldea"
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
