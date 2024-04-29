//
//  DexView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 28/03/2024.
//

import SwiftUI
import CoreData

struct FoldersView: View {
    
    @StateObject var vm: FoldersViewModel
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)])
    var folder: FetchedResults<Folder>


    
    var body: some View {
        NavigationView {
            VStack(){
                
                Button("Add folder") {
                    vm.showNameFolder = true
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: FolderView(vm: FolderViewModel())) {
                    FolderIconView(progress: 1, total: 10, name: "Test")
                }
                
                Spacer()
//                Text("folder items : \(folder.count)")
            }
        }
        
        .alert("Folder name", isPresented: $vm.showNameFolder) {
            TextField("Enter folder name", text: $vm.name)
            Button("OK", action: vm.addFolder)
        } message: {
            Text("Please atape folder name.")
        }
        
        .navigationTitle("Folders")
    }
}

struct DexView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersView(vm: FoldersViewModel())
    }
}
