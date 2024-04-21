//
//  SummaryPokemonsCaught.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 12/04/2024.
//

import SwiftUI

struct SummaryPokemonsCaught: View {
    
    var pokemonsCaught: Int
    var percent: Double
    
    init(pokemonsCaught: Int) {
        self.pokemonsCaught = pokemonsCaught
        self.percent = Double(pokemonsCaught) / Double(Constraints.numOfPokemons)  * 100
    }
    
    var body: some View {
        ZStack() {
            HStack() {
                VStack(alignment: .leading){
                    
                    Text("Pokemons Caught")
                        .lineLimit(1)
                        .padding(.vertical, 5)
                        .font(.system(size: 22, weight: .bold))
                    Text("\(pokemonsCaught) of 1025")
                        .font(.system(size: 22))
                    Text("Cards Owned")
                        .lineLimit(1)
                        .padding(.vertical, 5)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Text("120")
                        .font(.system(size: 22))
                }
                .padding(.horizontal, 30)
                Spacer()
            }
            HStack(){
                Spacer()

                GaugeView(percantge: percent)
                    .padding(.trailing, 30)
                    .frame(width: 150)
            }
        }
    }
}

struct SummaryPokemonsCaught_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPokemonsCaught(pokemonsCaught: 2)
    }
}
