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
    
    
    func toData() -> [DataModel] {
        return [DataModel(key: "Name", value: self.name), DataModel(key:"Type", value: self.type), DataModel(key:"Dimension", value: self.dimension), DataModel(key:"Residents", value: "\(self.residents?.count ?? 0)")]
    }
}

