//
//  ExtensionCellView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 24/04/2024.
//

import SwiftUI

struct ExtensionCellView: View {
    let setData: PokemonSets
    var body: some View {
            HStack(){
                AsyncImage(
                    url: URL(string: setData.images.logo),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: 80, maxHeight: 50)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                
                Text(setData.name)
                    .bold()
                
                Spacer()
                
                AsyncImage(
                    url: URL(string: setData.images.symbol),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: 40, maxHeight: 40)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
            }
            .padding(.horizontal, 10)
            .background(Color("cellColor"))
            .cornerRadius(20)
    }
}

#Preview {
    ExtensionCellView(setData: PokemonSets(printedTotal: 200, total: 250, name: "Temporarl Forces", series: "Scarlet & Violet", ptcgoCode: "SVI", images: PokemonSetsImages(symbol: "https://images.pokemontcg.io/sv1/symbol.png", logo: "https://images.pokemontcg.io/sv1/logo.png")))
}
