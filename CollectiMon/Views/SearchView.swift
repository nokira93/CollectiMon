//
//  SearchView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 17/04/2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var vm: SearchViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.searchResults, id: \.self) { pok in
//                    NavigationLink {
                        Text(":D")
//                    } label: {
//                        Text(name)
//                    }
                }
            }
        }
        .searchable(text: $vm.searchText)
    }
}

#Preview {
    SearchView(vm: SearchViewModel())
}
