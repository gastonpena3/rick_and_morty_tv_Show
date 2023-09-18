//
//  GenericCellView.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import SwiftUI

struct GenericCellView: View {
    
    var title: String
    var description: String?
    
    var body: some View {
        VStack {

                HStack {
                    
                    Text(title)
                        .font(.headline).bold()
                        .foregroundColor(Color.primary)
                    
                    Spacer()
                    
                    if let description = description {
                        
                        Text(description)
                            .foregroundColor(Color.primary)
                        
                    }
                }
        }
        .padding()
    }
    
}
