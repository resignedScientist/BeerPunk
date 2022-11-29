//
//  BeerDetailViewModel.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 29.11.22.
//

import Foundation

class BeerDetailViewModel: ObservableObject {
    
    @Published var beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }
}
