//
//  HomeViewModelProtocols.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 17/09/2023.
//

import Foundation

protocol HomeViewModelProtocols: ObservableObject {
    
    var repository: CharactersRepositoryProtocols { get set }
    var errorView: any ErrorViewModelProtocol { get set }
    var charactersResponse: Characters?  { get set }
    var charactersList: [Character]  { get set }
    var selectedCharacter: Character?  { get set }
    var isScrolling: Bool  { get set }
    var characterNextPage: String?  { get set }
    var isLoadingMoreCharcaters: Bool  { get set }
    var isLoading: Bool  { get set }
    var goToDetailsView: Bool  { get set }

    ///Get Character List from API
    func getCharacters(callback: @escaping () -> ())

    ///Save API URL Next Page
    func setNextpage(from url: String)
    
}
