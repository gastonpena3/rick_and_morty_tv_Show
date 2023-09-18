//
//  DataModel.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

struct DataModel: Identifiable {
    
    var id = UUID()
    var key: String
    var value: String?
    var isUserInteracionEnable: Bool? = false

}
