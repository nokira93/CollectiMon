//
//  CoreDataManager.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 05/04/2024.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PokemonInfo")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext

    private init() {
        
    }
    
    
    func getPokemons(gen: Generations) {
        let totalNum = gen.getNum()
        for i in 1...totalNum {
            APIManager.shared.fetchPokemons(pokID: i) { pok in
                    if let typName = pok.types.first?.type.name {
                        let pokemon = self.createBasicPokemotnInfoModel()
                        pokemon.id = Int16(i)
//                        pokemon.collectedCards = false
                        pokemon.image = pok.sprites.front_default
                        pokemon.name = pok.name
//                        pokemon.region = gen.rawValue
                        pokemon.type = pok.types.first?.type.name
                }
            }
        }
        self.saveContext()
    }
    
    func createBasicPokemotnInfoModel() -> PokemonInfo {
        PokemonInfo(context: storeContainer.viewContext)
    }
    
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func checkIfHaveToReload() -> Bool {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PokemonInfo")
             let count  = try managedContext.count(for: fetchRequest)
             return count == 0
         } catch {
             return true
         }
    }
    
}
