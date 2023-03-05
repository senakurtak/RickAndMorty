//
//  RMCharacterResponse.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Foundation

class RMCharacterResponse: Codable {
    let info : Info
    let results : [RMCharacter]
}
