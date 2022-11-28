//
//  MainViewModel.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    let repository: BeerRepository
    
    @Published var beers: [Beer] = []
    @Published var error: Error?
    @Published var selectedBeer: Beer?
    @Published var navigationPath = NavigationPath()
    
    private var fetchBeersTask: Task<Void, Error>?
    
    init(repository: BeerRepository) {
        self.repository = repository
    }
    
    func onAppear() {
        fetchBeersTask = Task { @MainActor [weak self] in
            do {
                self?.beers = try await repository.fetchBeers()
            } catch {
                print(error)
                self?.error = error
            }
        }
    }
    
    func onDisappear() {
        fetchBeersTask?.cancel()
    }
}
