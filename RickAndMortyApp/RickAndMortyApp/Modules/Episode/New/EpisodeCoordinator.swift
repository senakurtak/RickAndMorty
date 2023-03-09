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

class EpisodeCoordinator: ReactiveCoordinator<Void>{
    
    private let rootViewController: UIViewController
    private let navigationController : UINavigationController
    
    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let vc = EpisodeListVC()
        let vm = EpisodeVM()
        vc.viewModel = vm
        navigationController.setViewControllers([vc], animated: true)
        return Observable.never()
    }
}