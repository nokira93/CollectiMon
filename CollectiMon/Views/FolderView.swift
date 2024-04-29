//
//  FolderView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 29/04/2024.
//

import SwiftUI

struct FolderView: View {
    @StateObject var vm: FolderViewModel

    
    var body: some View {
        ScrollView {
            Text("View in progress")
//            SummaryPokemonsCaught(pokemonsCaught: poke.filter{ $0.caught }.count )
//            
//            ForEach(Generations.allCases, id: \.rawValue) { gen in
//
//                HStack(){
//                    Text("\(gen.rawValue) |")
//                        .font(.title3)
//                        .bold()
//                    Text("\(vm.pokemonCaught) of \(gen.getNum())")
//                        .font(.title3)
//                        .bold()
//                        .foregroundColor(.blue)
//                }
//                LazyVGrid(columns: vm.colums, spacing: 20) {
//                    ForEach(gen.pokemonsFrom() - 1 ..< gen.pokemonsTo()) { index in
//
//                        let pok = poke[index]
//                        let pokType = PokType(rawValue: pok.type ?? "normal")
//                        PokMiniatureView(pokemon: PokemonInfoModel(name: pok.name ?? "Ledyba", number: Int(pok.id), image: pok.image!, color: pokType?.getColor() ?? .red, caught: pok.caught))
//                        
//                            .cornerRadius(20)
//                    }
//                }.padding(.horizontal, 20)
//            }
        }
    }
}

//#Preview {
//    FolderView()
//}
