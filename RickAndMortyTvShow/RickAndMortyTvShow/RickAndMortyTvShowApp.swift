//
//  RickAndMortyTvShowApp.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import SwiftUI

@main
struct RickAndMortyTvShowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
