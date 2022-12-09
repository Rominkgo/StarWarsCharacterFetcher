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
    
    func fetchStoredCharacters() {
        let data = StarWarsPersistenceService.shared
        let list = data.getSWCharacter() ?? []
        let storedList = transformData(list: list)
        if storedList.isEmpty {
            fetchCharacters()
        } else {
            let newList = extractStarWars(charactersName: storedList)
            self.homeView?.displayNewChars(newList)
        }
        
    }
    
    func fetchCharacters() {
        
        repository.fetchCharacterNames { [weak self] list in
            self?.homeView?.displayNewChars(self?.extractStarWars(charactersName: list) ?? [])
            self?.saveSWCharacters(list)
            debugPrint("David wants this here")
        }

    }
    
    func getStarWarsCharactersName(list: [StarWarsChars]) -> [String] {
        var newString: [String] = []
        for item in list {
            let name = item.name
            newString.append(name)
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
    
    func transformData(list: [SWCharacter]) -> [StarWarsChars] {
        
        var newList: [StarWarsChars] = []
        
        for item in list {
            let character = StarWarsChars(name: item.name ?? "", eye_color: item.eye_color ?? "")
            newList.append(character)
        }
        
        return newList
    }
    
    func sendDataToVC(listToSend: [StarWarsChars]) {
        
    }
    
    func ApiDataChecker(_ data: [StarWarsChars]) {
        
        //        let incomingData = fetchCharacters()
        //        for item in data {
        //            if incomingData.contains(item){
        //                debugPrint("You have this data already")
        //            } else {
        //                debugPrint("You have new data")
        //            }
    }
    
}



protocol HomeViewProtocol: AnyObject {
    func displayNewChars(_ newCharacters: [String])
}

protocol HomePresenterProtocol {
    func setViewDelegate(view: HomeViewProtocol)
    func fetchCharacters()
    func fetchStoredCharacters()
}
