//
//  SummaryPokemonsCaught.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 12/04/2024.
//

import SwiftUI

struct SummaryPokemonsCaught: View {
    
    var body: some View {
        ZStack() {
            HStack() {
                VStack(alignment: .leading){
                    
                    Text("Pokemons Caught")
                        .lineLimit(1)
                        .padding(.vertical, 5)
                        .font(.system(size: 22, weight: .bold))
                    Text("100 of 1025")
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

                GaugeView(percantge: 21.5)
                    .padding(.trailing, 30)
                    .frame(width: 150)
            }
        }
    }
}

struct SummaryPokemonsCaught_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPokemonsCaught()
    }
}