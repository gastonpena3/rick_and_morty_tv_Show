//
//  CharacterRepository.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import Foundation

class CharactersRepository: CharactersRepositoryProtocols {

    public private(set) var config: APIConfig = APIConfig()
    private(set) var api: APIClient = APIClient()
    
    ///Get Characters List
    func getCharacters(for page: String? = nil, callback: @escaping (Result<Characters?, Error>) -> Void) {
        
        var nextPage = ""
        if let page = page {
            nextPage = "?page=\(page)"
        }
        let url = URL(string:config.baseURL + "character" + nextPage)
        
        api.request(url, responseModel: Characters.self) { result in
            switch result {
            case .success(let characters):
                callback(.success(characters))
            case .failure(let error):
                print("Error getting rick & morty characters: \(error.localizedDescription)")
                
                callback(.failure(error))
            }
        }
    }
    
    ///Get Character by ID
    func getCharacter(for id: Int, callback: @escaping (Result<Character?, Error>) -> Void) {
        let url = URL(string:config.baseURL + "character/\(id)")
        
        api.request(url, responseModel: Character.self) { result in
            switch result {
            case .success(let character):
                callback(.success(character))
            case .failure(let error):
                print("Error getting rick & morty character by id: \(error.localizedDescription)")
                
                callback(.failure(error))
            }
        }
    }
    
    ///Get Character Location Details
    func getCharacterLocation(from id: Int, callback: @escaping (Result<Location?, Error>) -> Void) {
        let url = URL(string:config.baseURL + "location/\(id)")
        
        api.request(url, responseModel: Location.self) { result in
            switch result {
            case .success(let location):
                callback(.success(location))
            case .failure(let error):
                print("Error getting rick & morty character Location Details: \(error.localizedDescription)")
                
                callback(.failure(error))
            }
        }
    }
}
