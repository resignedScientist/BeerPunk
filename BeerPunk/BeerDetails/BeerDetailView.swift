//
//  BeerDetailView.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 29.11.22.
//

import SwiftUI

struct BeerDetailView: View {
    
    @ObservedObject var viewModel: BeerDetailViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    AsyncImage(url: viewModel.beer.imageURL, scale: 3)
                        .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.beer.tagline)
                            .font(.headline)
                            .padding(.bottom)
                        Text(viewModel.beer.description)
                    }
                }
                
                
            }
            .padding()
        }
        .navigationTitle(viewModel.beer.name)
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            BeerDetailView(
                viewModel: BeerDetailViewModel(beer: Beer(id: 0, name: "Weißbier", tagline: "A real bitter experience", firstBrewed: "2000 vor Christus", description: "Ein super tolles Weißbier. Der Klassiker.", imageURL: URL(string: "https://images.punkapi.com/v2/192.png")!, volume: Volume(value: 5, unit: "Liter"), boilVolume: Volume(value: 10, unit: "Liter"), foodPairing: ["Weißwurscht"], brewersTips: "Mit Brezel und Weißwurscht genießen", contributor: "Unbekannt"))
            )
        }
    }
}
