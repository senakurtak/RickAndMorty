//
//  CharacterVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//
import Moya
import RxSwift
import UIKit

final class CharacterVM: BaseVM {

    var characterList = PublishSubject<[RMCharacter]>()

    var bag: DisposeBag = DisposeBag()

    var goToDetailCharacter = PublishSubject<[RMCharacter]>()

    let repository = CharacterRepository()

    func fetchCharacter() {
        repository.fetchCharacter().subscribe(onNext: { response in
            self.characterList
                .onNext(response.results)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
}
