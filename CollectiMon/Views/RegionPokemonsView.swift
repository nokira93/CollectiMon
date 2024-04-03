//
//  RegionPokemonsView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI

struct RegionPokemonsView: View {
    @StateObject var vm: RegionPokemonsViewModel
    
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
                ForEach(vm.pokemonsArr, id: \.self) { pok in
                    PokMiniatureView(pokemon: pok)
                        .cornerRadius(20)
                }
            }.padding(.horizontal, 20)
        }
//        .background(.white)
    }
}

struct RegionPokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionPokemonsView(vm: RegionPokemonsViewModel(regionName: "Kanto", totalNumber: 151, pokemonCaught: 1))
    }
}

//pokemonArr: [
//    PokemonInfoModel(name: "Bulbasaur", number: 1, image: "bulbasaur", color: .green, caught: true), PokemonInfoModel(name: "Bulbasaur", number: 1, image: "bulbasaur", color: .orange, caught: false), PokemonInfoModel(name: "Bulbasaur", number: 1, image: "bulbasaur", color: .red, caught: false), PokemonInfoModel(name: "Bulbasaur", number: 1, image: "bulbasaur", color: .mint, caught: true), PokemonInfoModel(name: "Bulbasaur", number: 1, image: "bulbasaur", color: .blue, caught: true)                      ]
