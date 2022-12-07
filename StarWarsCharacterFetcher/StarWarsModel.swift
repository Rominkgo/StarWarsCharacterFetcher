//
//  StarWarsModel.swift
//  StarWarsCharacterFetcher
//
//  Created by Default on 12/6/22.
//

import Foundation


struct StarWarsCharsFetched: Codable {
    let results: [StarWarsChars]
}


struct StarWarsChars: Codable {
    let name: String
    let eye_color: String
}
