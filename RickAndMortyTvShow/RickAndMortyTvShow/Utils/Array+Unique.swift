//
//  Array+Unique.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 17/09/2023.
//

import Foundation

extension Sequence where Element: Hashable {
    
    func uniqued() -> [Element] {
        var set = Set<Element>()
        
        return filter { set.insert($0).inserted }
    }
}
