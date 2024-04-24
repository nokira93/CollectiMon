//
//  LoadingViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 23/04/2024.
//

import Foundation
import SwiftUI
import Combine

class LoadingViewModel: ObservableObject {
    
    @Published var loaded: Int = 0
    var cancellable: [AnyCancellable] = []
    
    init() {
        APIManager.shared.pokemonFetched.sink { [weak self] value in
            //Do testow narazie
            var newValue: Double
            newValue = value / Double(Constraints.numOfPokemons)
            newValue = newValue * 100
            if Int(newValue) != self?.loaded {
                DispatchQueue.main.async {
                    self?.loaded = Int(newValue)
                    print("Test loaded: \(self?.loaded)")
                }
            }
        }.store(in: &cancellable)
    }
    
}
