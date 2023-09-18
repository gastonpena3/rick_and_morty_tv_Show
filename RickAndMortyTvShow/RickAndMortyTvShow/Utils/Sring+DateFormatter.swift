//
//  Sring+DateFormatter.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import Foundation

extension String {
    
    func formattedDate() -> String? {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        } else {
           return nil
        }
    }
}
