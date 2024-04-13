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
            SummaryPokemonsCaught()
            
            ForEach(Generations.allCases, id: \.rawValue) { gen in

                HStack(){
                    Text("\(gen.rawValue) |")
                        .font(.title3)
                        .bold()
                    Text("\(vm.pokemonCaught) of \(gen.getNum())")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                }
                LazyVGrid(columns: vm.colums, spacing: 20) {
                    ForEach(gen.pokemonsFrom() - 1 ..< gen.pokemonsTo()) { index in
//                    ForEach(poke, id: \.id) { pok in
                        let pok = poke[index]
                        let pokType = PokType(rawValue: pok.type ?? "normal")
                        PokMiniatureView(pokemon: PokemonInfoModel(name: pok.name ?? "Ledyba", number: Int(pok.id), image: pok.image!, color: pokType?.getColor() ?? .red, caught: pok.caught))
                        //                    PokMiniatureView(pokemon: pok)
                            .cornerRadius(20)
                    }
                }.padding(.horizontal, 20)
            }
        }
        .onAppear{
            CoreDataManager.shared.saveContext()
        }
    }
}

struct RegionPokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionPokemonsView(vm: RegionPokemonsViewModel(regionName: "Kanto", totalNumber: 151, pokemonCaught: 1))
    }
}
