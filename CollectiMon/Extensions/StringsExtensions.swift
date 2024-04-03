//
//  StringsExtensions.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 30/03/2024.
//

import Foundation

extension String {
    var capitalizedFirstLetter: String {
        return prefix(1).capitalized + dropFirst()
    }
}
