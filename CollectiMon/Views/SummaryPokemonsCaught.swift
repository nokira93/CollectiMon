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
//Gaure View
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(.blue.opacity(0.25), lineWidth: 20)
                    
                    Circle()
                        .trim(from: 0, to: percent / 100)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .rotationEffect(.degrees(270))
                    
                    VStack {
                        Text("\(String(format: "%.1f", percent))%")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.blue.opacity(0.8))
                    }
                }
//                }               GaugeView(percantge: percent)
                    .padding(.trailing, 30)
                    .frame(width: 150)
                
//                GaugeView(percantge: percent)
//                    .padding(.trailing, 30)
//                    .frame(width: 150)
            }
        }
    }
}

struct SummaryPokemonsCaught_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPokemonsCaught(pokemonsCaught: 2)
    }
}
