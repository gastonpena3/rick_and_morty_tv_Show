//
//  CharactersRepositoryMock.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

class CharactersRepositoryMock: CharactersRepositoryProtocols {
    
    private(set) var api: APIClientMock = APIClientMock()
    
    func getCharacters(for page: String?, callback: @escaping (Result<Characters?, Error>) -> Void) {
        api.request(mockName: "Characters", responseModel: Characters.self) { result in
            switch result {
            case .success(let characters):
                callback(.success(characters))
                
            case .failure(let error):
                print("Error getting characters: \(error.localizedDescription)")
                
                callback(.failure(error))
            }
        }
    }
    
    func getCharacter(for id: Int, callback: @escaping (Result<Character?, Error>) -> Void) {
        api.request(mockName: "Character", responseModel: Character.self) { result in
            switch result {
            case .success(let character):
                callback(.success(character))
                
            case .failure(let error):
                print("Error getting character: \(error.localizedDescription)")
                
                callback(.failure(error))
            }
        }
    }
    
    func getCharacterLocation(from id: Int, callback: @escaping (Result<Location?, Error>) -> Void) {
        api.request(mockName: "Location", responseModel: Location.self) { result in
            switch result {
            case .success(let location):
                callback(.success(location))
                
            case .failure(let error):
                print("Error getting character's location: \(error.localizedDescription)")
                
                callback(.failure(error))
            }
        }
    }
}
