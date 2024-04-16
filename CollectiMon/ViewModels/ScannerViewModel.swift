//
//  ScannerViewModel.swift
//  CollectiMon
//
//  Created by Artur Jurkowski on 14/04/2024.
//

import SwiftUI

class ScannerViewModel: ObservableObject {

    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let result):
            
            print("Test sukces")

        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}
