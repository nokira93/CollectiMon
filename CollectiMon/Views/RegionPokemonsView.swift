//
//  RegionPokemonsView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI

struct RegionPokemonsView: View {
    @StateObject var vm: RegionPokemonsViewModel
    
    @Environment(\.managedObjectContext) var managedObject
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \PokemonInfo.id, ascending: true)]) var poke: FetchedResults<PokemonInfo>
    
    var body: some View {
        ScrollView {
            HStack(){
                Text("\(vm.regionName) |")
                    .font(.title3)
                    .bold()
                Text("\(vm.pokemonCaught) of \(vm.totalNumber)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)
            }
            LazyVGrid(columns: vm.colums, spacing: 20) {
                ForEach(poke, id: \.id) { pok in
                    let pokType = PokType(rawValue: pok.type ?? "normal")
                    PokMiniatureView(pokemon: PokemonInfoModel(name: pok.name ?? "Ledyba", number: Int(pok.id), image: pok.image ?? "", color: pokType?.getColor() ?? .red, caught: pok.caught))
//                    PokMiniatureView(pokemon: pok)
                        .cornerRadius(20)
                }
            }.padding(.horizontal, 20)
        }
    }
}

struct RegionPokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionPokemonsView(vm: RegionPokemonsViewModel(regionName: "Kanto", totalNumber: 151, pokemonCaught: 1))
    }
}
