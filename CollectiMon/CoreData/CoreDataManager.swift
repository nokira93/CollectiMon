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
        let container = NSPersistentContainer(name: "CardDex")
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
    
    
    func prepareRegions() {
        for gen in Generations.allCases {
            let region = self.createRegionModel()
            region.regionName = gen.rawValue
            getPokemons(gen: gen, reg: region)
        }
    }
    
    func getPokemons(gen: Generations, reg: Region) {
        for i in gen.pokemonsFrom()...gen.pokemonsTo() {
            APIManager.shared.fetchPokemons(pokID: i) { pok in
                    if let typName = pok.types.first?.type.name {
                        let pokemon = self.createBasicPokemotnInfoModel()
                        pokemon.id = Int16(i)
                        pokemon.image = pok.sprites.front_default
                        pokemon.name = pok.name
                        pokemon.caught = false
                        reg.addToPokemon(pokemon)
                        pokemon.type = pok.types.first?.type.name
                }
            }
        }
        self.saveContext()
    }
    
    func createBasicPokemotnInfoModel() -> PokemonInfo {
        PokemonInfo(context: storeContainer.viewContext)
    }
    
    func createRegionModel() -> Region {
        Region(context: storeContainer.viewContext)
    }
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
            print("Saved File")
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func checkIfHaveToReload() -> Bool {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PokemonInfo")
             let count  = try managedContext.count(for: fetchRequest)
            print("Test coredata count: \(count)")
             return count == 0
         } catch {
             return true
         }
    }
    
    func pokemonIsCaught(id: Int16, newValue: Bool) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PokemonInfo")
        fetchRequest.predicate = NSPredicate(format: "id = \(id)", id)

        do {
            let results = try managedContext.fetch(fetchRequest)
            if let entityToUpdate = results.first as? NSManagedObject {
                entityToUpdate.setValue(newValue, forKey: "caught")
                self.saveContext()
            }
        } catch {
            print("Błąd podczas pobierania: \(error)")
        }
        
    }
}
