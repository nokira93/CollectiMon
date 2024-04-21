//
//  PokMiniatureView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI

struct PokMiniatureView: View {
   @State var pokemon: PokemonInfoModel
    
    var body: some View {
        ZStack(){
            Rectangle()
                .foregroundColor(pokemon.caught ? pokemon.color : .white)
            VStack() {
                HStack() {
                    Spacer()
                    Text("# \(pokemon.number)")
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                }
                if pokemon.caught {
                    AsyncImage(url: URL(string: pokemon.image))
                        .scaledToFit()
                
                } else {
                    AsyncImage(url: URL(string: pokemon.image))
                        .scaledToFit()
                        .saturation(0.0)
                    
//                    Color.gray
//                        .mask(
//                            AsyncImage(url: URL(string: pokemon.image))
//                                .scaledToFit()
//                            )
                    
//                            AsyncImage(
//                                url: URL(string: pokemon.image),
//                                content: { image in
//                                    image.resizable()
//                                        .scaledToFit()
//                                },
//                                placeholder: {
//                                    ProgressView()
//                                }
//                            )
//                        )
                }
                
                Text(pokemon.name.capitalizedFirstLetter.replacingMWithGenderSymbol())
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 20)
                    .padding(.horizontal, 5)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
        }
        .onTapGesture {
            CoreDataManager.shared.pokemonIsCaught(id: Int16(pokemon.number), newValue: !pokemon.caught)
            pokemon.caught.toggle()
        }
    }
}

struct PokMiniatureView_Previews: PreviewProvider {
    static var previews: some View {
        PokMiniatureView(pokemon: PokemonInfoModel(name: "Bulbasaur", number: 1, image: "bulbasaur", color: .green, caught: false))
    }
}
