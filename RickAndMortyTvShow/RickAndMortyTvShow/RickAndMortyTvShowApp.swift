//
//  RickAndMortyTvShowApp.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import SwiftUI

@main
struct RickAndMortyTvShowApp: App {
    
    let viewModel: HomeViewModel = HomeViewModel(repository: CharactersRepository(), errorView: ErrorViewModel())

    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: viewModel)
        }
    }
}
