//
//  EpisodeVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Moya
import RxSwift
import UIKit

class EpisodeVM: BaseVM {

    var episodeList = PublishSubject<[RMEpisode]>()

    var bag: DisposeBag = DisposeBag()

    var goToDetail = PublishSubject<[RMEpisode]>()

    let repository = EpisodeRepository()

    func fetchEpisode() {
        repository.fetchRickAndMortieEpisode()
            .subscribe(onNext: { response in
            self.episodeList.onNext(response.results)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
}
