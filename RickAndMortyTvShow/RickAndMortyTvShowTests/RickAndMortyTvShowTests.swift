//
//  RickAndMortyTvShowTests.swift
//  RickAndMortyTvShowTests
//
//  Created by Gastón Pena on 15/09/2023.
//

import XCTest
@testable import RickAndMortyTvShow

final class RickAndMortyTvShowTests: XCTestCase {
    
    var homeViewModel: HomeViewModel!
    var detailsViewModel: DetailsViewModel!
    var character: Character!

    override func setUpWithError() throws {
        homeViewModel = HomeViewModel(repository: CharactersRepositoryMock(), errorView: ErrorViewModel())
        detailsViewModel = DetailsViewModel(repository: CharactersRepositoryMock(), errorView: ErrorViewModel())
    }

    override func tearDownWithError() throws {
        homeViewModel = nil
        detailsViewModel = nil
    }

    func test_GetCharacters() {
        homeViewModel.getCharacters { [weak self] in
            DispatchQueue.main.async {
                XCTAssertTrue(self?.homeViewModel.charactersList.count == 20)
            }
        }
    }
    
    func test_GetCharacterDataForID() {
        detailsViewModel.getData(for: 1, with: false) { [weak self] in
            DispatchQueue.main.async {
                XCTAssertNotNil(self?.detailsViewModel.dataSource)
                XCTAssertTrue(self?.detailsViewModel.dataSource?.first?.value == "Rick Sanchez")
            }
        }
    }
    
    func test_GetCharacterLocationForID() {
        detailsViewModel.getData(for: 1, with: true) { [weak self] in
            DispatchQueue.main.async {
                XCTAssertNotNil(self?.detailsViewModel.dataSource)
                XCTAssertTrue(self?.detailsViewModel.dataSource?.first?.value == "Citadel of Ricks")
            }
        }
    }
    
    func test_SetNextPage() {
        homeViewModel.setNextpage(from: "https://rickandmortyapi.com/api/character?page=3")
        XCTAssertTrue(homeViewModel.characterNextPage == "3")
    }

}
