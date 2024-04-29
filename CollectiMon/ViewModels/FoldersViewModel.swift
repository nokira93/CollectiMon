//
//  FolderViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/04/2024.
//

import Foundation
import SwiftUI

class FoldersViewModel: ObservableObject {
    
    @Published var showNameFolder: Bool = false
    @Published var name = ""
    
    init(){
        
    }
    
    func addFolder() {
        CoreDataManager.shared.makeNewFolder(name: name)
        name = ""
    }
}
