//
//  ApiManager.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import UIKit
import Combine
import CoreData

protocol ApiProviderDelegate {
    func didUpdate()
    func didFailWithError(error: Error)
}

class APIManager {
    
    static let shared = APIManager()
    
    let pokemonFetched = PassthroughSubject<Double, Never>()
    var fetched = 0
    
    private init(){
        
    }
    
    func fetchPokemons(pokID: Int, completionHandler: @escaping (PokemonBasicInfo) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokID)") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching: \(error)")
                return
            }
            if let data = data {
                do {
                    let pokemon = try JSONDecoder().decode(PokemonBasicInfo.self, from: data)
                    self.fetched += 1
                    self.pokemonFetched.send(Double(self.fetched))
                    completionHandler(pokemon)
                } catch {
                    self.fetched += 1
                    self.pokemonFetched.send(Double(self.fetched))
                    print("Error decoding: id: \(pokID) || \(error)")
                }
            }
        }
        .resume()
    }
    
    func fetchSeries(completionHandler: @escaping (SeriesResults) -> Void) {
        guard let url = URL(string: "https://api.pokemontcg.io/v2/sets?q=series:Scarlet&Violet") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching: \(error)")
                return
            }
            if let data = data {
                do {
                    let series = try JSONDecoder().decode(SeriesResults.self, from: data)
                    
                    completionHandler(series)
                } catch {
                    print("Error decoding series: \(error)")
                }
            }
        }
        .resume()
    }
    
    func fetchCards(setName: String, completionHandler: @escaping (PokemonCardResults) -> Void) {
        
        var page = 1
        var fetchURL = "https://api.pokemontcg.io/v2/cards?pageSize=50&q=set.id:sv3"
//        var fetchURL =  "https://api.pokemontcg.io/v2/cards?page=\(page)&q=set.id:\(setName)"
        
        guard let url = URL(string: fetchURL) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching: \(error)")
                return
            }
            if let data = data {
                do {
                    print("Test fetchCard1: \(fetchURL)")
                    let cards = try JSONDecoder().decode(PokemonCardResults.self, from: data)
//                    print("Test fetchCard1: \(fetchURL)")
                    completionHandler(cards)
                } catch {
                    print("Error decoding series: \(error)")
                }
            }
        }
        .resume()
    }
    func checkPage() -> Bool {
        
        return false
    }
}

//https://api.pokemontcg.io/v2/cards?page=1&q=set.id:sv4
//https://api.pokemontcg.io/v2/sets?pageSize=250
//
//https://api.pokemontcg.io/v2/cards?page=2&q=set.id:sv4
