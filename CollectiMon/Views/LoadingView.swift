//
//  LoadingView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 20/04/2024.
//

import SwiftUI
import Lottie
//import Combine

struct LoadingView: View {
    var loaded: Int = 0
    
    var body: some View {
        VStack() {
            LottieSwitch(animation: .named("pokeballAnimation"))
                .padding(.horizontal, 30)
                .scaledToFit()
            Text("Loading...")
                .font(.title)
                .bold()
            Text("\(loaded) %")
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    LoadingView()
}
