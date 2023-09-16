//
//  APIClient.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import Foundation

enum ApiError: Error {
    case urlError
    case dataError
    case pathError
}

struct APIClient {
    
    func request<T: Decodable>(_ url: URL?, responseModel: T.Type,
            completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = url else {
            
            completion(.failure(ApiError.urlError))
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                
                if let error = error {
                    
                    completion(.failure(error))
                    
                } else {
                    
                    completion(.failure(ApiError.dataError))
                    
                }
                
                return
            }
            
            do {
                
                let result = try JSONDecoder().decode(responseModel, from: data)
                
                completion(.success(result))
                
            } catch {
                
                completion(.failure(error))
                
            }
            
        }
        
        task.resume()
    }
}
