//
//  EpisodeCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class EpisodeCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController
    private let navigationController: UINavigationController

    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        let episodeListVC = EpisodeListVC()
        let episodeVM = EpisodeVM()
        episodeListVC.viewModel = episodeVM

        episodeVM.goToDetail.subscribe(onNext: { model in
            self.goToDetail(model: model)
        }).disposed(by: disposeBag)
        self.navigationController.setViewControllers([episodeListVC], animated: true)
        return Observable.never()
    }

    private func goToDetail(model: [RMEpisode]) -> Observable<Void> {
        let coordinator = EpisodeDetailCoordinator(rootViewController: self.rootViewController, episodeItems: model)
        return coordinate(to: coordinator)
    }
}
