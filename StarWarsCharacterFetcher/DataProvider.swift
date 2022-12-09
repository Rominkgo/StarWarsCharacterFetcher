////
////  DataProvider.swift
////  StarWarsCharacterFetcher
////
////  Created by Default on 12/8/22.
////
//
//import Foundation
//
//class StarWarsAPIRepository: StarWarsRepositoryProtocol {
//
//    let persistence = StarWarsPersistenceService.shared
//
//    private let url = URL(string: "https://swapi.dev/api/people")
//
//    func fetchCharacterNames(onSuccess: @escaping ([StarWarsChars]) -> Void) {
//
//
//
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            if error == nil {
//                do {
//                    let response = try JSONDecoder().decode(StarWarsCharsFetched.self, from: data!)
//                    onSuccess(response.results)
//
//                }
//                catch {
//                    print("error")
//                }
//            }
//        }).resume()
//    }
//}
//
//
//
//class DataChecker {
//
//    let presenter = StarWarsPresenter(repository: StarWarsRepositoryProtocol.self as! StarWarsRepositoryProtocol)
//
//    let storedData = StarWarsPersistenceService.shared
//    let incomingData = presenter.fetchCharacters()
//
//    func ApiDataChecker(_ data: [StarWarsChars]) {
//
//
//        for item in data {
//            if incomingData.contains(item){
//                debugPrint("You have this data already")
//            } else {
//                debugPrint("You have new data")
//            }
//        }
//
//    }
//
//}
