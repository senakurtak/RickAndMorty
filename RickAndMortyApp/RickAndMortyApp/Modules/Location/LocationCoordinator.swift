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

class LocationCoordinator: ReactiveCoordinator<Void>{
    
    private let rootViewController: UIViewController
    private let navigationController : UINavigationController
    
    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let vc = LocationVC()
        let vm = LocationVM()
        vc.viewModel = vm
        navigationController.setViewControllers([vc], animated: true)
        return Observable.never()
    }
}
