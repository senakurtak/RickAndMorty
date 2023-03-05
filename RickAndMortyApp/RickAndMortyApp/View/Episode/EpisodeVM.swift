//
//  EpisodeVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Moya
import RxSwift
import UIKit

class EpisodeVM : ObservableObject {
    
    var episodeList = PublishSubject<RMEpisodeResponse>()
    
    var bag : DisposeBag = DisposeBag()
    
    func fetchEpisode(){
        NetworkManager.shared.fetchRickAndMortieEpisode().subscribe(onNext: { response in
            self.episodeList.onNext(response)
            print(self.episodeList)
            print(response)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }}
