//
//  SetsDetailViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 27/04/2024.
//

import Foundation

class SetsDetailViewModel: ObservableObject {
    
    let setID: String
    
    init(setID: String, test: Sets){
        print("Test setID: \(test)")
        self.setID = setID
        self.fetchCards()
    }
    
    
    func checkIfHaveCards() {
//        if !CoreDataManager.shared.checkIfHaveCards(id: setID) {
//            fetchCards()
//        }
    }
    
    func fetchCards(){
        CoreDataManager.shared.getCards(setID: "sv3")
        CoreDataManager.shared.getCards(setID: setID)
    }
}
