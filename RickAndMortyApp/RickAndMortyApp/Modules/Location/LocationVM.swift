//
//  LocationVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Moya
import RxSwift
import UIKit

class LocationVM: BaseVM {

    var locationList = PublishSubject<[RMLocation]>()

    var bag: DisposeBag = DisposeBag()

    var goToDetailLocation = PublishSubject<[RMLocation]>()

    func fetchLocation() {
        NetworkManager.shared.fetchRickAndMortieLocation().subscribe(onNext: { response in
            self.locationList
                .onNext(response.results)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }}
