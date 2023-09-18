//
//  CharacterDetailsView.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    let characterId: Int?
    
    @ObservedObject var viewModel = CharacterDetailsViewModel(repository: CharactersRepository())
    
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    var body: some View {
        
        NavigationStack {
            
            LoadingView(isShowing: $viewModel.isLoading) {
                
                VStack {
                    List {
                        
                        ForEach(viewModel.character?.toData() ?? []) { data in
                            
                            getCellFor(data: data)
                            
                        }
                    }
                }

            }
            .onAppear{
                viewModel.isLoading = true
                
                viewModel.getCharacter(for: self.characterId ?? 0) {
                    
                    viewModel.isLoading = false
                }
            }
        }
        
    }
    
    @ViewBuilder func getCellFor(data: DataModel) -> some View {
        
        if data.isUserInteracionEnable ?? false {
            
            VStack {
                
                NavigationLink(destination: LocationDetailsView()) {
                    
                    GenericCellView(title: data.key, description: data.value)
                }
            }
            
        } else {
            
            VStack {
                
                GenericCellView(title: data.key, description: data.value)
            }

        }

    }
    
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(characterId: 0)
    }
}
