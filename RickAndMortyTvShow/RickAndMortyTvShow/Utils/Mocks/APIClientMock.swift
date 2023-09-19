//
//  APIClientMock.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

struct APIClientMock {
    
    func request<T: Decodable>(mockName: String, responseModel: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        do {
            if let path = Bundle.main.path(forResource: mockName, ofType: "json"),
               let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
                let result = try JSONDecoder().decode(responseModel, from: jsonData)
                
                completion(.success(result))
            }
        } catch {
            // handle error
            completion(.failure(error))
        }
    }
}
