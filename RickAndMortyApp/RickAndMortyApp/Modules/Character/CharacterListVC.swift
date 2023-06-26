//
//  CharacterListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import RxSwift
import RxCocoa

final class CharacterListVC: BaseVC<CharacterVM> {

    private let characterListView = CharacterListView()

    var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchCharacter()
        title = "Character"
        view.addSubview(characterListView)
        collectionDataBinding()
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func collectionDataBinding() {
        characterListView.collectionView.register(CharacterCVC.self,
                                                  forCellWithReuseIdentifier: CharacterCVC.cellIdentifier)

        self.characterListView.collectionView
            .rx
            .setDelegate(self).disposed(by: disposeBag)
        viewModel!.characterList
            .bind(to: characterListView.collectionView
            .rx
            .items(cellIdentifier: CharacterCVC.cellIdentifier,
                   cellType: CharacterCVC.self)) { (_, chr, cell) in
            var viewModel = CharacterCVCVM(characterName: chr.name ?? "",
                                           characterStatus: chr.status,
                                           characterImageUrl: URL(string: chr.image ?? ""))
            cell.configure(with: viewModel)
        }
        .disposed(by: bag)

        // MARK: character did select
        Observable
            .zip(characterListView.collectionView
                .rx
                .itemSelected,
                 characterListView.collectionView
                .rx
                .modelSelected(RMCharacter.self))
            .bind { _, character in
                self.viewModel?.goToDetailCharacter
                    .onNext([character])
            } .disposed(by: disposeBag)
    }
}

extension CharacterListVC: UICollectionViewDelegate {

}
