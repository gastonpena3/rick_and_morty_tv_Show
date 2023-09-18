//
//  CharacterDetailsViewModel.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

class CharacterDetailsViewModel: CharacterDetailsViewModelProtocols {
    
    internal var repository: CharactersRepositoryProtocols
    @Published var character: Character?
    @Published var isLiked = false
    @Published var isLoading = true
    
    init(repository: CharactersRepositoryProtocols) {
        self.repository = repository
    }
    
    func getCharacter(for id: Int, callback: @escaping () -> ()) {
        
        self.repository.getCharacter(for: id) { result in
            
            switch result {
                
            case .success(let character):
                
                DispatchQueue.main.async {
                    
                    self.character = character
                    
                    callback()
                }
                
            case .failure(let error):
                
                //TODO: Show Error
                
                callback()
            }
        }
        
    }
}
