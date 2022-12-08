//
//  StarWarsPresenter.swift
//  StarWarsCharacterFetcher
//
//  Created by Default on 12/6/22.
//

import Foundation

class StarWarsPresenter: HomePresenterProtocol {
    
    weak var homeView: HomeViewProtocol?
    private let repository: StarWarsRepositoryProtocol
    
    let persistence = StarWarsPersistenceService.shared
    
    
    init(repository: StarWarsRepositoryProtocol) {
        self.repository = repository
    }
    
    func setViewDelegate(view: HomeViewProtocol) {
        self.homeView = view
    }
    
    func fetchCharacters() {
        repository.fetchCharacterNames { [weak self] list in
            self?.homeView?.displayNewChars(self?.extractStarWars(charactersName: list) ?? [])
        }
    }
    
    func getStarWarsCharactersName(list: [StarWarsChars]) -> [String] {
        var newString: [String] = []
        for item in list {
            newString.append(item.name)
        }
        return newString
    }
    
    func extractStarWars(charactersName list: [StarWarsChars]) -> [String] {
        return list.map { $0.name }
    }
    
    func saveSWCharacters(_ toBeSaved: [StarWarsChars]){
        
        for item in toBeSaved {
            persistence.save(starWarsCharacter: item)
        }
        persistence.save()
    }
    
    func transformData(_ SWCharacter: [SWCharacter]) -> [StarWarsChars] {
//        let data = StarWarsPersistenceService.shared.getSWCharacter()!
//        var newList: [StarWarsChars] = []
//        var results = newList.append(data)
        
    }
       
        
}

protocol HomeViewProtocol: AnyObject {
    func displayNewChars(_ newCharacters: [String])
}

protocol HomePresenterProtocol {
    func setViewDelegate(view: HomeViewProtocol)
    func fetchCharacters()
}
