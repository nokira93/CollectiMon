//
//  MainViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 20/04/2024.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    var cancellable: [AnyCancellable] = []
    
    init() {
        
        CoreDataManager.shared.allPokemonFetched.sink { value in
            if value {
                self.isLoading = false
                CoreDataManager.shared.saveContext()
            }
        }
        .store(in: &cancellable)
        
        if CoreDataManager.shared.checkIfHaveToReload() {
            CoreDataManager.shared.prepareRegions()
        }
    }
}
