//
//  CharacterDetailsView.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 18/09/2023.
//

import SwiftUI

struct DetailsView: View {
    
    let characterId: Int?
    let getLocation: Bool?
    
    @ObservedObject var viewModel = CharacterDetailsViewModel(repository: CharactersRepository())
    
    init(characterId: Int, getLocation: Bool = false) {
        self.characterId = characterId
        self.getLocation = getLocation
    }
    
    var body: some View {
        NavigationStack {
            LoadingView(isShowing: $viewModel.isLoading) {
                VStack {
                    List {
                        ForEach(viewModel.dataSource ?? []) { data in
                            getCellFor(data: data)
                        }
                    }
                }
            }
            .onAppear{
                viewModel.isLoading = true
                viewModel.getData(for: self.characterId ?? 0, with: getLocation ?? false) {
                    viewModel.isLoading = false
                }
            }
        }
    }
    
    @ViewBuilder func getCellFor(data: DataModel) -> some View {
        if data.isUserInteracionEnable ?? false {
            VStack {
                NavigationLink(destination: DetailsView(characterId: self.characterId ?? 0, getLocation: true)) {
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
        DetailsView(characterId: 0)
    }
}
