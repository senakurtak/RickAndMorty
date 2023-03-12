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

class LocationDetailCoordinator : ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    
    var locations : [RMLocation]
    
    init(rootViewController: UIViewController, locations: [RMLocation]){
        self.rootViewController = rootViewController
        self.locations = locations
    }
    
    override func start() -> Observable<Void> {
        let vc = LocationDetailVC()
        let vm = LocationDetailVM()
        vc.viewModel = vm
        vc.locations = self.locations
        self.rootViewController.navigationController?.pushViewController(vc, animated: true)
        return Observable.never()
    }
}
