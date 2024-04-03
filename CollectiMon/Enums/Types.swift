//
//  PokType.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 30/03/2024.
//

import Foundation
import SwiftUI

enum PokType: String {
    case normal = "normal"
    case fire = "fire"
    case water = "water"
    case electric = "electric"
    case grass = "grass"
    case ice = "ice"
    case fighting = "fighting"
    case poison = "poison"
    case ground = "ground"
    case flying = "flying"
    case psychic = "psychic"
    case bug = "bug"
    case rock = "rock"
    case ghost = "ghost"
    case dragon = "dragon"
    case dark = "dark"
    case steel = "steel"
    case fairy = "fairy"
}
extension PokType {
    func getColor() -> Color {
        switch self{
        case .normal:
            return Color(UIColor(red: 102/255, green: 205/255, blue: 255/255, alpha: 1))
        case .fire:
            return Color(UIColor(red: 255/255, green: 68/255, blue: 35/255, alpha: 1))
        case .water:
            return Color(UIColor(red: 52/255, green: 153/255, blue: 255/255, alpha: 1))
        case .electric:
            return Color(UIColor(red: 255/255, green: 204/255, blue: 51/255, alpha: 1))
        case .grass:
            return Color(UIColor(red: 119/255, green: 204/255, blue: 86/255, alpha: 1))
        case .ice:
            return Color(UIColor(red: 102/255, green: 205/255, blue: 255/255, alpha: 1))
        case .fighting:
            return Color(UIColor(red: 188/255, green: 86/255, blue: 68/255, alpha: 1))
        case .poison:
            return Color(UIColor(red: 171/255, green: 85/255, blue: 154/255, alpha: 1))
        case .ground:
            return Color(UIColor(red: 222/255, green: 187/255, blue: 85/255, alpha: 1))
        case .flying:
            return Color(UIColor(red: 137/255, green: 153/255, blue: 255/255, alpha: 1))
        case .psychic:
            return Color(UIColor(red: 255/255, green: 85/255, blue: 153/255, alpha: 1))
        case .bug:
            return Color(UIColor(red: 171/255, green: 187/255, blue: 34/255, alpha: 1))
        case .rock:
            return Color(UIColor(red: 187/255, green: 170/255, blue: 102/255, alpha: 1))
        case .ghost:
            return Color(UIColor(red: 103/255, green: 103/255, blue: 187/255, alpha: 1))
        case .dragon:
            return Color(UIColor(red: 119/255, green: 102/255, blue: 239/255, alpha: 1))
        case .dark:
            return Color(UIColor(red: 120/255, green: 85/255, blue: 68/255, alpha: 1))
        case .steel:
            return Color(UIColor(red: 170/255, green: 171/255, blue: 187/255, alpha: 1))
        case .fairy:
            return Color(UIColor(red: 238/255, green: 154/255, blue: 239/255, alpha: 1))
        }
    }
}
