//
//  LocationDetailController.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class LocationDetailCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController

    var locations: [RMLocation]

    init(rootViewController: UIViewController, locations: [RMLocation]) {
        self.rootViewController = rootViewController
        self.locations = locations
    }

    override func start() -> Observable<Void> {
        let locationDetailVC = LocationDetailVC()
        let locationDetailVM = LocationDetailVM()
        locationDetailVC.viewModel = locationDetailVM
        locationDetailVC.locations = self.locations
        self.rootViewController.navigationController?.pushViewController(locationDetailVC, animated: true)
        return Observable.never()
    }
}
