//
//  LocationCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//
import UIKit
import Foundation
import RxSwift
import RxCocoa

class LocationCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController
    private let navigationController: UINavigationController

    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        let locationListVC = LocationListVC()
        let locationVM = LocationVM()
        locationListVC.viewModel = locationVM

        locationVM.goToDetailLocation.subscribe(onNext: { location in
            self.goToDetailLocation(location: location)
        }).disposed(by: disposeBag)

        navigationController.setViewControllers([locationListVC], animated: true)
        return Observable.never()
    }

    private func goToDetailLocation(location: [RMLocation]) -> Observable<Void> {
        let coordinator = LocationDetailCoordinator(rootViewController: self.rootViewController, locations: location)
        return coordinate(to: coordinator)
    }
}
