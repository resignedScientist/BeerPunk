//
//  Amount.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import Foundation

struct Amount: Decodable, Hashable {
    let value: Double
    let unit: String
}
