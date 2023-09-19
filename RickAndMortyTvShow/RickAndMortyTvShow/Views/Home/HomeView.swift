//
//  HomeView.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 15/09/2023.
//

import SwiftUI

struct HomeView<HomeViewModel>: View where HomeViewModel : HomeViewModelProtocols {
    
    @StateObject var homeViewModel: HomeViewModel

    init(homeViewModel: HomeViewModel) {
        self._homeViewModel = StateObject(wrappedValue: homeViewModel)
    }
    
    var body: some View {
        NavigationStack {
            LoadingView(isShowing: $homeViewModel.isLoading) {
                List {
                    ForEach(Array(homeViewModel.charactersList.enumerated()), id: \.offset) { index, character in
                        Button(action: {
                            homeViewModel.selectedCharacter = character
                            homeViewModel.goToDetailsView = true
                        }, label: {
                            HomeViewCell(character: character)
                        })
                        
                        .onAppear() {
                            if (homeViewModel.charactersList.last == character) {
                                homeViewModel.isLoadingMoreCharcaters = true
                                homeViewModel.isScrolling = true
                                
                                self.homeViewModel.getCharacters {
                                    DispatchQueue.main.async {
                                        homeViewModel.isScrolling = false
                                        homeViewModel.isLoadingMoreCharcaters = false
                                    }
                                }
                            }
                        }
                    }
                    
                    if homeViewModel.isLoadingMoreCharcaters {
                        HStack(alignment: .center) {
                            Spacer()
                            
                            ProgressView()
                                .foregroundColor(.secondary)
                            
                            Spacer()
                        }
                        .frame(height: 50)
                    }
                }
                .frame( maxWidth: .infinity)
                .listStyle(GroupedListStyle())
                .navigationDestination(isPresented: $homeViewModel.goToDetailsView) {
                    if let character = homeViewModel.selectedCharacter {
                        goToDetails(with: character)
                    }
                }
                .navigationBarTitle("Rick & Morty", displayMode: .large)
            }
            .onAppear() {
                homeViewModel.isLoading = true
                
                ///Fetch Characters From API
                homeViewModel.getCharacters() {
                    homeViewModel.isLoading = false
                }
            }
            .onDisappear() {
                homeViewModel.isLoading = false
            }
            .alert(homeViewModel.errorView.errorMessage, isPresented: $homeViewModel.errorView.showErrorAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    func goToDetails(with character: Character) -> DetailsView<DetailsViewModel> {
        let viewModel = DetailsViewModel(repository: CharactersRepository(), errorView: ErrorViewModel(), characterId: homeViewModel.selectedCharacter?.id ?? 0)
        return DetailsView(viewModel: viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel: HomeViewModel = HomeViewModel(repository: CharactersRepository(), errorView: ErrorViewModel())
        HomeView(homeViewModel: viewModel)
    }
}
