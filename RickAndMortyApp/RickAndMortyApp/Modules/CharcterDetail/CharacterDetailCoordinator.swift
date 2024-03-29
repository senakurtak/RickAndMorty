//
//  CharacterDetailCoordinator.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//
import UIKit
import Foundation
import RxSwift
import RxCocoa

class CharacterDetailCoordinator: ReactiveCoordinator<Void> {

    private let rootViewController: UIViewController

    var characters: [RMCharacter]

    init(rootViewController: UIViewController, characters: [RMCharacter]) {
        self.rootViewController = rootViewController
        self.characters = characters
    }

    override func start() -> Observable<Void> {
        let characterDetailListVC = CharacterDetailListVC()
        let characterDetailVM = CharacterDetailVM()
        characterDetailListVC.viewModel = characterDetailVM
        characterDetailListVC.characterItems = self.characters
        self.rootViewController.navigationController?.pushViewController(characterDetailListVC, animated: true)
        return Observable.never()
    }

}
