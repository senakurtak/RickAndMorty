//
//  BaseRepository.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 29.06.2023.
//

import Foundation

class BaseRepository {

    let networkManager: NetworkManager

    init() {
        self.networkManager = NetworkManager.shared
    }
    
}
