//
//  CharactersProtocols.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import Foundation

protocol CharactersRepositoryProtocols {
    
    ///Get Characters List
    func getCharacters(for page: String?, callback: @escaping (Result<Characters?, Error>) -> Void)
    
    ///Get Character by ID
    func getCharacter(for id: Int, callback: @escaping (Result<Character?, Error>) -> Void)
    
    ///Get Character Location Details
    func getCharacterLocationDetails(from location: String, callback: @escaping (Result<Location?, Error>) -> Void)

}
