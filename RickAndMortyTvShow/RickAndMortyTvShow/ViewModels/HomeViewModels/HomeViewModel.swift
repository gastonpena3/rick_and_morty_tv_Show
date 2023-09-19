//
//  HomeViewModel.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import Foundation

class HomeViewModel: HomeViewModelProtocols {

    internal var repository: CharactersRepositoryProtocols
    internal var errorView: any ErrorViewModelProtocol
    
    @Published var charactersResponse: Characters?
    @Published var charactersList: [Character] = []
    @Published var isScrolling: Bool = false
    @Published var characterNextPage: String?
    @Published var isLoadingMoreCharcaters = false
    @Published var selectedCharacter: Character?
    @Published var isLoading = true
    @Published var goToDetailsView: Bool = false
    
    init(repository: CharactersRepositoryProtocols, errorView: any ErrorViewModelProtocol) {
        self.repository = repository
        self.errorView = errorView
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

                    //Avoid Duplicate Characters in List
                    self.charactersList = self.charactersList.uniqued()
                    callback()
                }
            case .failure(let error):
                ///Show error
                self.errorView.showAPIError(with: "Error retrieving Characters: \(error.localizedDescription)")
                
                callback()
            }
        }
    }

    func setNextpage(from url: String) {
        let currentURLValue = Int(self.characterNextPage?.getNumber() ?? "") ?? 0
        let newURLValue = Int(url.getNumber()) ?? 0
        
        if newURLValue > currentURLValue {
            self.characterNextPage = "\(newURLValue)"
        }
    }
    
}
