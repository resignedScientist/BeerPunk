//
//  BeerRepository.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import Foundation

protocol BeerRepository {
    
    func fetchBeers() async throws -> [Beer]
    
    func fetchBeer() async throws -> Beer
}
