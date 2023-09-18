//
//  CharacterDetailsViewModel.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

class DetailsViewModel: DetailsViewModelProtocols {
    
    internal var repository: CharactersRepositoryProtocols
    internal var errorView: any ErrorViewModelProtocol
    
    @Published var dataSource: [DataModel]?
    @Published var isLiked = false
    @Published var isLoading = true
    
    init(repository: CharactersRepositoryProtocols, errorView: any ErrorViewModelProtocol) {
        self.repository = repository
        self.errorView = errorView
    }
    
    func getData(for id: Int, with location: Bool, callback: @escaping () -> ()) {
        if location {
            self.getLocation(for: id) {
                callback()
            }
        } else {
            self.getCharacter(for: id) {
                callback()
            }
        }
    }
    
    func getCharacter(for id: Int, callback: @escaping () -> ()) {
        self.repository.getCharacter(for: id) { result in
            switch result {
            case .success(let character):
                DispatchQueue.main.async {
                    self.dataSource = character?.toData()

                    callback()
                }
            case .failure(let error):
                ///Show error
                self.errorView.showAPIError(with: "Error retrieving Character from ID: \(error.localizedDescription)")
                
                callback()
            }
        }
    }
    
    func getLocation(for id: Int, callback: @escaping () -> ()) {
        repository.getCharacterLocation(from: id) { result in
            switch result {
            case .success(let location):
                DispatchQueue.main.async {
                    self.dataSource = location?.toData()
                    
                    callback()
                }
            case .failure(let error):
                ///Show error
                self.errorView.showAPIError(with: "Error retrieving Character Location: \(error.localizedDescription)")
                
                callback()
            }
        }
            
    }
}
