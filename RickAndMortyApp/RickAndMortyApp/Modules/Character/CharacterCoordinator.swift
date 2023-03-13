//
//  CharacterCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class CharacterCoordinator: ReactiveCoordinator<Void>{
    
    private let rootViewController: UIViewController
    private let navigationController : UINavigationController
    
    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let vc = CharacterListVC()
        let vm = CharacterVM()
        vc.viewModel = vm
        vm.goToDetailCharacter.subscribe(onNext: { character in
            self.goToDetailCharacter(character: character)
        }).disposed(by: disposeBag)
        self.navigationController.setViewControllers([vc], animated: true)
        return Observable.never()
    }
    
    private func goToDetailCharacter(character: [RMCharacter]) -> Observable<Void> {
        let coordinator = CharacterDetailCoordinator(rootViewController: self.rootViewController, characters: character)
        return coordinate(to: coordinator)
    }

}
