//
//  CharacterDetailsViewModelProtocol.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

protocol CharacterDetailsViewModelProtocols: ObservableObject {
    
    var repository: CharactersRepositoryProtocols { get set }
    var character: Character? { get set }
    var isLiked: Bool { get set }
    var isLoading: Bool  { get set }
    
    ///Get Character by ID from API
    func getCharacter(for id: Int, callback: @escaping () -> ())
}
