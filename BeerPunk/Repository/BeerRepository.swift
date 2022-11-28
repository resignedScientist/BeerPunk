//
//  BeerRepository.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import Foundation

enum Constants {
    static let baseURL = "https://api.punkapi.com/v2/beers"
}

protocol BeerRepository {
    
    func fetchBeers() async throws -> [Beer]
    
    func fetchBeer(id: Int) async throws -> Beer
}

class BeerRepositoryImpl: BeerRepository {
    
    func fetchBeers() async throws -> [Beer] {
        guard let url = URL(string: Constants.baseURL) else {
            throw BeerError.unknown
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        
        let str = String(data: data, encoding: .utf8)!
        print(str)
        
        return try decoder.decode([Beer].self, from: data)
    }
    
    func fetchBeer(id: Int) async throws -> Beer {
        guard let url = URL(string: "\(Constants.baseURL)/\(id)") else {
            throw BeerError.unknown
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        
        return try decoder.decode(Beer.self, from: data)
    }
}

class MockBeerRepository: BeerRepository {
    
    func fetchBeers() async throws -> [Beer] {
        [
            Beer(id: 0, name: "Weißbier", tagline: "bier", firstBrewed: "2000 vor Christus", description: "Ein super tolles Weißbier. Der Klassiker.", imageURL: URL(string: "https://images.punkapi.com/v2/192.png")!, volume: Volume(value: 5, unit: "Liter"), boilVolume: Volume(value: 10, unit: "Liter"), foodPairing: ["Weißwurscht"], brewersTips: "Mit Brezel und Weißwurscht genießen", contributor: "Unbekannt")
        ]
    }
    
    func fetchBeer(id: Int) async throws -> Beer {
        try await fetchBeers()[0]
    }
}

enum BeerError: LocalizedError {
    case unknown
}
