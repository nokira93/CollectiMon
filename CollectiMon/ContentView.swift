//
//  ContentView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var vm: MainViewModel = MainViewModel()

    var body: some View {
        if vm.isLoading {
            LoadingView()
        } else {
            TabView{
                RegionPokemonsView(vm: RegionPokemonsViewModel(regionName: "Kanto", totalNumber: 151, pokemonCaught: 1))
                    .environment(\.managedObjectContext, CoreDataManager.shared.managedContext)
                    .tabItem {
                        Label("Dex", systemImage: "text.book.closed")
                    }
                DexView()
                    .tabItem {
                        Label("Expensions", systemImage: "folder")
                    }
                DexView()
                    .tabItem {
                        Label("Folders", systemImage: "bookmark.fill")
                    }
                SearchView(vm: SearchViewModel())
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                ScannerView(vm: ScannerViewModel())
                    .tabItem {
                        Label("Scanner", systemImage: "scanner")
                    }
            }
        }
//        .onAppear{
//            if CoreDataManager.shared.checkIfHaveToReload() {
//                CoreDataManager.shared.prepareRegions()
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
