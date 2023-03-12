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


class EpisodeDetailCoordinator: ReactiveCoordinator<Void>{
    
    private let rootViewController: UIViewController
    
    var episodeItems : [RMEpisode]
    
    init(rootViewController: UIViewController, episodeItems: [RMEpisode]) {
        self.rootViewController = rootViewController
        self.episodeItems = episodeItems
    }
    
    override func start() -> Observable<Void> {
        let vc = EpisodeDetailListVC()
        let vm = EpisodeDetailVM()
        vc.viewModel = vm
        vc.episodeItems = self.episodeItems
        self.rootViewController.navigationController?.pushViewController(vc, animated: true)
        return Observable.never()
    }
    
    
}

