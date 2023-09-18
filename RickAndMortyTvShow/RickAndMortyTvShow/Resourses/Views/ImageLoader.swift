//
//  ImageLoader.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 17/09/2023.
//

import UIKit
import SwiftUI
import Kingfisher

class ImageLoader {
    
    static var share = ImageLoader()

    func setTvShowPoster(imageURL: String) -> KFImage {
        KFImage(
            URL(string: "\(imageURL)")
        )
        .onSuccess { result in
            print("Image Load Success")
        }
        .onFailure { error in
            print("Failure loading image \(error)")
        }
        .placeholder {
            Image(systemName: "text.below.photo")
                .font(.largeTitle)
                .opacity(0.5)
        }
    }
}
