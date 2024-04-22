//
//  GaugeView.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 12/04/2024.
//

import SwiftUI

struct GaugeView: View {
    @State var percantge: Double
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(.blue.opacity(0.25), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: percantge / 100)
                .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(270))
            
            VStack {
                Text("\(String(format: "%.1f", percantge))%")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.blue.opacity(0.8))
            }
            
        }
    }
}
