//
//  EpisodeRepository.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 30.06.2023.
//

import Foundation
import RxSwift

protocol EpisodeRepositoryProtocol {
    func fetchRickAndMortieEpisode() -> Observable<RMEpisodeResponse>
}

final class EpisodeRepository: BaseRepository {
    func fetchRickAndMortieEpisode() -> Observable<RMEpisodeResponse> {
        networkManager.fetchRickAndMortieEpisode()
    }
}
