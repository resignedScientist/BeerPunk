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

enum BeerError: LocalizedError {
    case unknown
}
