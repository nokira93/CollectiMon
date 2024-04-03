//
//  ContentView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        TabView{
            DexView()
                    .tabItem {
                        Label("Dex", systemImage: "text.book.closed")
                    }
            DexView()
                    .tabItem {
                        Label("Expensions", systemImage: "folder")
                    }
            RegionPokemonsView(vm: RegionPokemonsViewModel(regionName: "Kanto", totalNumber: 151, pokemonCaught: 1))
                    .tabItem {
                        Label("Folders", systemImage: "bookmark.fill")
                    }
            DexView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            DexView()
                    .tabItem {
                        Label("Scanner", systemImage: "scanner")
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
