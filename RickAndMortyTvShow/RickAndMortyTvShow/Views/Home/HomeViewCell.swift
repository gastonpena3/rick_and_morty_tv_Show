//
//  HomeViewCell.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import SwiftUI

struct HomeViewCell: View {
    
    var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        HStack {
            ImageLoader.share.setTvShowPoster(imageURL: character.image ?? "")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(height: 80)
                .cornerRadius(10)
                .padding(.vertical, 5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(character.name ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Episodes:  \(character.episode?.count ?? 0)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 10)
        }
    }
}

