//
//  LikeButton.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import SwiftUI

struct LikeButton: View {
    
    @Binding var isLiked: Bool
    
    var body: some View {
        Button(action: {
            self.isLiked.toggle()
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundColor(Color.red)
        })
    }
}
