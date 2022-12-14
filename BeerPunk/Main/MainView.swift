//
//  MainView.swift
//  BeerPunk
//
//  Created by Laudien, Norman on 28.11.22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            List(viewModel.beers, id: \.id) { beer in
                NavigationLink(beer.name) {
                    BeerDetailView(
                        viewModel: BeerDetailViewModel(
                            beer: beer
                        )
                    )
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("BeerPunk")
        }
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
        .overlay(alignment: .center) {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel(
                repository: MockBeerRepository()
            )
        )
    }
}
