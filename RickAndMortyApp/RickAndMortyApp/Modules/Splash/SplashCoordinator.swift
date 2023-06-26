//
//  SplashCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//
import UIKit
import Foundation
import RxSwift
import RxCocoa

class SplashCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    override func start() -> Observable<Void> {
        let splashVC = SplashVC()
        let splashVM = SplashVM()
        splashVC.viewModel = splashVM

        splashVM.goMain.map { _ in
            self.goToMain()
        }.subscribe().disposed(by: disposeBag)

        self.rootViewController.navigationController?.pushViewController(splashVC, animated: true)
        return Observable.never()
    }

    private func goToMain() -> Observable<Void> {

        let coordinator = TabBarCoordinator(rootViewController: self.rootViewController)
        return coordinate(to: coordinator)
    }
}
