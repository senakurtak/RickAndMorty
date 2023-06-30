//
//  LocationRepository.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 30.06.2023.
//

import Foundation
import RxSwift

protocol LocationRepositoryProtocol {
    func fetchLocation() ->
    Observable<RMLocationResponse>
}

final class LocationRepository: BaseRepository {
    func fetchLocation() ->
    Observable<RMLocationResponse> {
        networkManager.fetchRickAndMortieLocation()
    }
}
