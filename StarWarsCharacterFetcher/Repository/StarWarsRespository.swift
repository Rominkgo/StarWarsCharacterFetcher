//
//  StarWarsRespository.swift
//  StarWarsCharacterFetcher
//
//  Created by Default on 12/6/22.
//

import Foundation

class StarWarsAPIRepository: StarWarsRepositoryProtocol {
    
    let persistence = StarWarsPersistenceService.shared
    
    private let url = URL(string: "https://swapi.dev/api/people")
    
    func fetchCharacterNames(onSuccess: @escaping ([StarWarsChars]) -> Void) {
        
        
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error == nil {
                do {
                    let response = try JSONDecoder().decode(StarWarsCharsFetched.self, from: data!)
                    onSuccess(response.results)

                }
                catch {
                    print("error")
                }
            }
        }).resume()        
    }
}

protocol StarWarsRepositoryProtocol {
    func fetchCharacterNames(onSuccess: @escaping ([StarWarsChars]) -> Void)
}



