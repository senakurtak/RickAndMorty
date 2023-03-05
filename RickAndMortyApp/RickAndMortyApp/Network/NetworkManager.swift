//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import Foundation
import Moya
import RxSwift
import RxMoya

protocol Networkable{
    var provider: MoyaProvider<API> { get }
    func fetchRickAndMortieCharacter() -> Observable<RMCharacterResponse>
    func fetchRickAndMortieEpisode() -> Observable<RMEpisodeResponse>
    func fetchRickAndMortieLocation() -> Observable<RMLocationResponse>
}

class NetworkManager : Networkable{
    
    var provider = MoyaProvider<API>()
    static let shared = NetworkManager()

    func fetchRickAndMortieCharacter() -> RxSwift.Observable<RMCharacterResponse> {
        request(target: .character)
    }
    
    func fetchRickAndMortieEpisode() -> RxSwift.Observable<RMEpisodeResponse> {
        request(target: .episode)
    }
    
    func fetchRickAndMortieLocation() -> RxSwift.Observable<RMLocationResponse> {
        request(target: .location)
    }
    
    func request<T: Codable>(target: API) -> Observable<T>{
        provider.rx.request(target)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map{ (result) in
                return try result.map ( T.self )
            }
            .catch { error in
                return Observable.error(error)
            }
    }
    
}
