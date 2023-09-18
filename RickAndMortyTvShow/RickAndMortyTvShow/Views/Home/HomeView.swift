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
                
                VStack {
                    
                    List {
                        
                        ForEach(Array(homeViewModel.charactersList.enumerated()), id: \.offset) { index, character in
                            
                            NavigationLink(destination: {
                                
                                CharacterDetailsView(characterId: character.id)
                                
                            }, label: {
                                
                                HStack {
                                    ImageLoader.share.setTvShowPoster(imageURL: character.image ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(height: 80)
                                        .cornerRadius(10)
                                        .padding(.vertical, 5)
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(character.name ?? "")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                        
                                        Text("Episodes:  \(character.episode?.count ?? 0)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.horizontal, 10)
                                }

                            })

                            .onAppear(){
                                
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel: HomeViewModel = HomeViewModel(repository: CharactersRepository())
        HomeView(homeViewModel: viewModel)
    }
}
