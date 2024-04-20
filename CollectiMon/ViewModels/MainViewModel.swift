//
//  MainViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 20/04/2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true

    init() {
        if CoreDataManager.shared.checkIfHaveToReload() {
            CoreDataManager.shared.prepareRegions()
        }
        isLoading = false
    }
}
