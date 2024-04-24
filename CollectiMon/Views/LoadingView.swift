//
//  LoadingView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 20/04/2024.
//

import SwiftUI
import Lottie
import Combine

struct LoadingView: View {
    @StateObject var vm: LoadingViewModel
    
    var body: some View {
        VStack() {
            LottieView(animation: .named("pokeballAnimation"))
                .playing(loopMode: .loop)
                .padding(.horizontal, 30)
                .scaledToFit()
                
                
            Text("Loading...")
                .font(.title)
                .bold()
            Text("\(vm.loaded) %")
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    LoadingView(vm: LoadingViewModel())
}
