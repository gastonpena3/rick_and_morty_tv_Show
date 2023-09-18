//
//  HomeViewModel.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import Foundation

class HomeViewModel: HomeViewModelProtocols {

    internal var repository: CharactersRepositoryProtocols

    @Published var charactersResponse: Characters?
    @Published var charactersList: [Character] = []
    @Published var isScrolling: Bool = false
    @Published var characterNextPage: String?
    @Published var isLoadingMoreCharcaters = false
    @Published var selectedCharacter: Character?
    @Published var isLoading = true
    @Published var goToDetailsView: Bool = false
    
    init(repository: CharactersRepositoryProtocols) {
        self.repository = repository
    }
    
    func getCharacters(callback: @escaping () -> ()) {
        var characterUrl: String?
        
        if isScrolling && characterNextPage != nil {
            characterUrl = characterNextPage
        }
        
        self.repository.getCharacters(for: characterUrl) { result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    self.charactersResponse = characters
                    self.setNextpage(from: characters?.info.next ?? "")
                    self.charactersList.append(contentsOf: characters?.results ?? [])

                    callback()
                }
            case .failure(let error):
                
                //TODO: Show Error

                callback()
            }
            
        }
        
    }

    func setNextpage(from url: String) {
        let currentURLValue = Int(self.characterNextPage?.getNumber() ?? "") ?? 0
        let newURLValue = Int(url.getNumber()) ?? 0
        
        if newURLValue > currentURLValue {
            self.characterNextPage = url
        }
    }
    
}
