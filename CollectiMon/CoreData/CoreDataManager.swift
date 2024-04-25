//
//  CoreDataManager.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 05/04/2024.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    let allPokemonFetched = PassthroughSubject<Bool, Never>()
    
    private let apiGroup = DispatchGroup()

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
        
        self.getSeries()
        
        apiGroup.notify(queue: .main) {
            self.allPokemonFetched.send(true)
//            CoreDataManager.shared.saveContext()
        }
    }
    
    func getPokemons(gen: Generations, reg: Region)  {
        for i in gen.pokemonsFrom()...gen.pokemonsTo() {
            apiGroup.enter()
            APIManager.shared.fetchPokemons(pokID: i) { pok in
                if let typName = pok.types.first?.type.name {
                    let pokemon = self.createBasicPokemotnInfoModel()
                    pokemon.id = Int16(i)
                    pokemon.image = pok.sprites.front_default
                    pokemon.name = pok.name
                    pokemon.caught = false
                    reg.addToPokemon(pokemon)
                    pokemon.type = typName
                    self.apiGroup.leave()
                }
            }
        }
    }
    
    func getSeries()  {
        APIManager.shared.fetchSeries() { arr in
//            self.apiGroup.enter()
            arr.data.forEach { series in
                let set = self.createSeriesModel()
                set.basicCards = Int16(series.printedTotal)
                set.totalCards = Int16(series.total)
                set.code = series.ptcgoCode
                set.logo = series.images.logo
                set.name = series.name
                set.series = series.series
                set.symbol = series.images.symbol
                print("Series: \(series.name) || \(series.total)")
//                self.apiGroup.leave()
            }
        }
    }
    
    func createBasicPokemotnInfoModel() -> PokemonInfo {
        PokemonInfo(context: storeContainer.viewContext)
    }
    
    func createSeriesModel() -> Sets {
        Sets(context: storeContainer.viewContext)
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
            
            return count != Constraints.numOfPokemons
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
    
    func delete(gen: Generations) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PokemonInfo")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            
//            managedContiext.deleteObject(managedObjectData)

        } catch let error as NSError {
            print("Detele all data in error : \(error) \(error.userInfo)")
        }
    }
}
