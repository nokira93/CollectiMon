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
                    completionHandler(pokemon)
                } catch {
                    self.fetchPokemons(pokID: pokID, completionHandler: completionHandler)
                    print("Error decoding: id: \(pokID) || \(error)")
                }
            }
        }.resume()
    }
}
