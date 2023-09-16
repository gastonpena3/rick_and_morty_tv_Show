//
//  Location.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 16/09/2023.
//

import Foundation

struct Location: Decodable {
    var id: Int?
    var name: String?
    var type: String?
    var dimension: String?
    var residents: [String]?
}

