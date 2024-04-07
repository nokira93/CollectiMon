//
//  RegionPokemonsViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import Foundation
import SwiftUI
import CoreData

class RegionPokemonsViewModel: ObservableObject {
    let regionName: String
    let totalNumber: Int
    let pokemonCaught: Int
   @Published var pokemonsArr: [PokemonInfoModel] = []
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(regionName: String, totalNumber: Int, pokemonCaught: Int) {
        self.regionName = regionName
        self.totalNumber = totalNumber
        self.pokemonCaught = pokemonCaught
        CoreDataManager.shared.checkIfHaveToReload()
        
//        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PokemonInfo")
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        let fetchedResults = FetchedResults<NSManagedObject>(fetchRequest: fetchRequest)
        CoreDataManager.shared.getPokemons(gen: .Kanto)
//        let totalNum = Generations.Kanto.getNum()
//        for i in 1...totalNum {
//            APIManager.shared.fetchPokemons(pokID: i) { pok in
//                    if let typName = pok.types.first?.type.name {
//                        let pokType = PokType(rawValue: typName)
//                        let pokemon = PokemonInfoModel(name: pok.name, number: i, image: pok.sprites.front_default, color: pokType?.getColor() ?? Color(UIColor(red: 102/255, green: 205/255, blue: 255/255, alpha: 1)), caught: true)
//                        self.pokemonsArr.append(pokemon)
//                }
//            }
//        }
    }
}
