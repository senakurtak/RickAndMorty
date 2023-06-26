//
//  MenuCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MenuCoordinator: ReactiveCoordinator<Void> {
    private let rootViewController: UIViewController
    private var navigationController: [UINavigationController]

    init(rootViewController: UIViewController, navigationController: [UINavigationController]) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        return Observable.never()
    }
}
