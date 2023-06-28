//
//  CharacterRepository.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 29.06.2023.
//

import Foundation
import RxSwift

protocol CharacterRepositoryProtocol {
    func fetchCharacter() -> Observable<RMCharacterResponse>
}

final class CharacterRepository: BaseRepository {

    func fetchCharacter() -> Observable<RMCharacterResponse> {
        networkManager.fetchRickAndMortieCharacter()
    }
}
