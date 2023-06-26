//
//  EpisodeDetailCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class EpisodeDetailCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController

    var episodeItems: [RMEpisode]

    init(rootViewController: UIViewController, episodeItems: [RMEpisode]) {
        self.rootViewController = rootViewController
        self.episodeItems = episodeItems
    }

    override func start() -> Observable<Void> {
        let episodeDetailListVC = EpisodeDetailListVC()
        let episodeDetailVM = EpisodeDetailVM()
        episodeDetailListVC.viewModel = episodeDetailVM
        episodeDetailListVC.episodeItems = self.episodeItems
        self.rootViewController.navigationController?.pushViewController(episodeDetailListVC, animated: true)
        return Observable.never()
    }
}
