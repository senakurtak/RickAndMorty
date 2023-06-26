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

class CharacterCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController
    private let navigationController: UINavigationController

    init(rootViewController: UIViewController, navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        let characterListVC = CharacterListVC()
        let characterVM = CharacterVM()
        characterListVC.viewModel = characterVM
        characterVM.goToDetailCharacter.subscribe(onNext: { character in
            self.goToDetailCharacter(character: character)
        }).disposed(by: disposeBag)
        self.navigationController.setViewControllers([characterListVC], animated: true)
        return Observable.never()
    }

    private func goToDetailCharacter(character: [RMCharacter]) -> Observable<Void> {
        let coordinator = CharacterDetailCoordinator(rootViewController: self.rootViewController, characters: character)
        return coordinate(to: coordinator)
    }

}
