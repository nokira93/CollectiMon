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
            LoadingView(vm: LoadingViewModel())
        } else {
            TabView{
                RegionPokemonsView(vm: RegionPokemonsViewModel(regionName: "Kanto", totalNumber: 151, pokemonCaught: 1))
                    .environment(\.managedObjectContext, CoreDataManager.shared.managedContext)
                    .tabItem {
                        Label("Dex", systemImage: "text.book.closed")
                    }
                ExtensionView(vm: ExtensionViewModel())
                    .environment(\.managedObjectContext, CoreDataManager.shared.managedContext)
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
            .background(Color("backColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
