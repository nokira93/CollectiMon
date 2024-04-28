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
    
    func getCards(setID: String)  {
        APIManager.shared.fetchCards(setName: setID) { arr in
//            self.apiGroup.enter()
            let setExtension = self.getExtension(setId: setID)
            arr.data.forEach { fetchedCard in
                
                let card = self.createCardsModel()
                
                card.id = fetchedCard.id
//                card.holo
                card.imageLarge = fetchedCard.images.large
                card.imageSmall = fetchedCard.images.small
                card.name = fetchedCard.name
                card.nationalPokedexNumbers = Int16(fetchedCard.nationalPokedexNumbers)
//                card.normal
                card.number = Int16(fetchedCard.number)
//                card.price = fetchedCard.tcgplayer.prices.holofoil
//                card.priceUpdateAt = fetchedCard.tcgplayer.updatedAt
                card.rarity = fetchedCard.rarity
//                card.reverse
                card.supertype = "Pokemon"
                card.tcgURL = URL(string: fetchedCard.tcgplayer.url)
                
                if let setEx = setExtension {
                    setEx.addToCard(card)
                }
                if let pokemon = self.getPokemon(number: fetchedCard.nationalPokedexNumbers) {
                    pokemon.addToCard(card)
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
                set.setID = series.id
                print("Series: \(series.name) || \(series.total)")
//                self.apiGroup.leave()
            }
        }
    }
    
    func createBasicPokemotnInfoModel() -> PokemonInfo {
        PokemonInfo(context: storeContainer.viewContext)
    }
    
    func createCardsModel() -> Card {
        Card(context: storeContainer.viewContext)
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
    
    
    func getExtension(setId: String) -> Sets? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sets")
        fetchRequest.predicate = NSPredicate(format: "code == %@", setId)

        do {
            let sets = try managedContext.fetch(fetchRequest)
            //do poprawy
            print("Udalo sie pobrac set")
            return sets.first as? Sets
        } catch let error as NSError {
            print("Nie udało się pobrać. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func getPokemon(number: Int) -> PokemonInfo? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PokemonInfo")
        fetchRequest.predicate = NSPredicate(format: "id == %@", Int16(number))

        do {
            let pokemon = try managedContext.fetch(fetchRequest)
            //do poprawy
            print("Udalo sie pobrac pokemona")
            return pokemon.first as? PokemonInfo
        } catch let error as NSError {
            print("Nie udało się pobrać pokemona. \(error), \(error.userInfo)")
            return nil
        }
    }
    
//    func checkIfHaveCards(id: String) -> Bool {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sets")
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//
//        do {
//            let set = try managedContext.fetch(fetchRequest)
//            
//            print("Udalo sie sprawdzic i sa juz karty")
//            return pokemon.first as? PokemonInfo
//        } catch let error as NSError {
//            print("Nie udało się pobrać pokemona. \(error), \(error.userInfo)")
//            return nil
//        }
//    }
}
