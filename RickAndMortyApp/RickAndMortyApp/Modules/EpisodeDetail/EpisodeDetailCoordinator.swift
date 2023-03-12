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
//    let detailId : Int
    
    init(rootViewController: UIViewController, episodeItems: [RMEpisode]) {
        self.rootViewController = rootViewController
        self.episodeItems = episodeItems
//        self.detailId = detailId
    }
    
    override func start() -> Observable<Void> {
        let vc = EpisodeDetailListVC()
        let vm = EpisodeDetailVM()
        vc.viewModel = vm
        vc.episodeItems = self.episodeItems
//        vc.detailID = self.detailId
        self.rootViewController.navigationController?.pushViewController(vc, animated: true)
        return Observable.never()
    }
    
    
}
