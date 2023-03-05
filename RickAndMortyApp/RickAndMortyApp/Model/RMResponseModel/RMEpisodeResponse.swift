//
//  RMEpisodeResponse.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Foundation

class RMEpisodeResponse: Codable {
    let info : Info
    let results : [RMEpisode]
}
