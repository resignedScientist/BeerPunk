//
//  Beer.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import Foundation

struct Beer: Decodable {
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let description: String
    let imageURL: URL
    let volume: Volume
    let boilVolume: Volume
    let ingredients: [String: Ingredient]
    let yeast: String
    let foodPairing: [String]
    let brewersTips: String
    let contributor: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case volume
        case boilVolume = "boil_volume"
        case ingredients
        case yeast
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributor = "contributed_by"
    }
}
