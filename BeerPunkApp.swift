//
//  BeerPunkApp.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import SwiftUI

@main
struct BeerPunkApp: App {
    
    private let repository: BeerRepository = BeerRepositoryImpl()
    
    var body: some Scene {
        WindowGroup {
            MainView(
                viewModel: MainViewModel(repository: repository)
            )
        }
    }
}
