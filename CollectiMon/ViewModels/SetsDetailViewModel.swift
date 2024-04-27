//
//  SetsDetailViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 27/04/2024.
//

import Foundation

class SetsDetailViewModel: ObservableObject {
    
    let setID: String
    
    init(setID: String){
        self.setID = setID
    }
    
    
    func checkIfHaveCards() {
//        if !CoreDataManager.shared.checkIfHaveCards(id: setID) {
//            fetchCards()
//        }
    }
    
    func fetchCards(){
        
    }
}
