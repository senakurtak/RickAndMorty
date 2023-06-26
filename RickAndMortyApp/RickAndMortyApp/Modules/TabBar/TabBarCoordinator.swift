//
//  TabBarCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Foundation
import RxSwift
import UIKit

class TabBarCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController
    private var navigationControllers: [UINavigationController]

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.navigationControllers = TabBarKind.items
            .map({ item -> UINavigationController in
                return item.navigationController
            })
    }

    override func start() -> Observable<Void> {
        let tabbarVC = TabBar()
        tabbarVC.tabBar.isTranslucent = false
        tabbarVC.viewControllers = navigationControllers

        let coordinates = navigationControllers.enumerated()
            .map { (offset, element) -> Observable<Void> in
                guard let items = TabBarKind(rawValue: offset) else {return Observable.just(())}

                switch items {
                case .character:
                    return coordinate(to: CharacterCoordinator(rootViewController: self.rootViewController,
                                                               navigationController: element) )
                case .episode:
                    return coordinate(to: EpisodeCoordinator(rootViewController: self.rootViewController,
                                                             navigationController: element))
                case .location:
                    return coordinate(to: LocationCoordinator(rootViewController: self.rootViewController,
                                                              navigationController: element))
                }
            }
        Observable.merge(coordinates)
            .subscribe()
            .disposed(by: disposeBag)

        rootViewController.navigationController!.setNavigationBarHidden(true, animated: true)
        rootViewController.navigationController?.pushViewController(tabbarVC, animated: false)
        return  Observable.never()

    }
}
