//
//  CharacterDetailsViewModelProtocol.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

protocol DetailsViewModelProtocols: ObservableObject {
    var repository: CharactersRepositoryProtocols { get set }
    var errorView: any ErrorViewModelProtocol { get set }
    var dataSource: [DataModel]? { get set }
    var character: Character? { get set }
    var isLoading: Bool  { get set }
    var isLiked: Bool { get set }
    
    ///Get Character Data for ID
    func getData(for id: Int, with location: Bool, callback: @escaping () -> ())
    
    ///Get Character for ID from API
    func getCharacter(for id: Int, callback: @escaping () -> ())
    
    ///Get Location for ID from API
    func getLocation(for id: Int, callback: @escaping () -> ())
}
