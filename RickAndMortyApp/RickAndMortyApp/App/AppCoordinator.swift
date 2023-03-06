//
//  AppCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import RxSwift
import UIKit

class AppCoordinator: ReactiveCoordinator<Void> {
    var window : UIWindow
    
    init(window : UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let controller = SplashVC()
        let navController = UINavigationController(rootViewController: controller)
        navController.setNavigationBarHidden(true, animated: true)
        let coordinator = SplashCoordinator(rootViewController: controller)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        return coordinate(to: coordinator)
    }
}
