//
//  ErrorViewModel.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

class ErrorViewModel: ErrorViewModelProtocol {
    
    @Published var showErrorAlert = false
    @Published var errorMessage: String = "Error"
    
    func showAPIError(with title: String) {
        self.showErrorAlert = true
        self.errorMessage = title
    }
}

