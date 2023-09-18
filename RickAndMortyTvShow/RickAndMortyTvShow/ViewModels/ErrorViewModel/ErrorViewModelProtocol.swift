//
//  ErrorViewModelProtocol.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

protocol ErrorViewModelProtocol: ObservableObject {
    
    var showErrorAlert: Bool  { get set }
    var errorMessage: String  { get set }
    
    ///Show Error View
    func showAPIError(with title: String)
}
