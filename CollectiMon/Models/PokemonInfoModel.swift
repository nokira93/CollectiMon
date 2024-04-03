//
//  PokemonInfoModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import Foundation
import SwiftUI

struct PokemonInfoModel: Hashable {
    var name: String
    var number: Int
    var image: String
    var color: Color
    var caught: Bool
}
