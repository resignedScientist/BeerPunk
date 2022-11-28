//
//  Ingredient.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import Foundation

struct Ingredient: Decodable {
    let name: String
    let amount: Amount
}
