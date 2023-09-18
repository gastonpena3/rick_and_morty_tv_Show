//
//  String+GetNumber.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 17/09/2023.
//

import Foundation

extension String {
    
    ///Extract number
    func getNumber() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted)
    }
}
