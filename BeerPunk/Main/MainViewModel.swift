//
//  MainViewModel.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    let repository: BeerRepository
    
    @Published private var allBeers: [Beer] = []
    private var fetchBeersTask: Task<Void, Error>?
    
    @Published var error: Error?
    @Published var selectedBeer: Beer?
    @Published var navigationPath = NavigationPath()
    @Published var searchText = ""
    @Published var isLoading = true
    
    var beers: [Beer] {
        if searchText.isEmpty {
            return allBeers
        } else {
            return allBeers.filter { beer in
                beer.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    init(repository: BeerRepository) {
        self.repository = repository
    }
    
    func onAppear() {
        fetchBeersTask = Task { @MainActor [weak self] in
            do {
                self?.allBeers = try await repository
                    .fetchBeers()
                    .sorted {$0.name < $1.name }
            } catch {
                print(error)
                self?.error = error
            }
            self?.isLoading = false
        }
    }
    
    func onDisappear() {
        fetchBeersTask?.cancel()
    }
}
