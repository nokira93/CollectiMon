//
//  SetsDetailViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 27/04/2024.
//

import Foundation
import SwiftUI

class SetsDetailViewModel: ObservableObject {
    
    let setID: String = "sv3"
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(setID: String, test: Sets){
        print("Test setID: \(test)")
//        self.setID = setID
        self.checkIfHaveCards()
    }
    
    
    func checkIfHaveCards() {
//        if !CoreDataManager.shared.checkIfHaveCards(id: setID) {
            fetchCards()
//        }
    }
    
    func fetchCards(){
        // trzebda dodac sprawdzenie i przekazywanie poprawnego id 
//        CoreDataManager.shared.getCards(setID: "sv3")
        CoreDataManager.shared.getCards(setID: setID)
    }
}
