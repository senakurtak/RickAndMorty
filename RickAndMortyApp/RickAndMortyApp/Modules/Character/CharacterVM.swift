//
//  CharacterVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//
import Moya
import RxSwift
import UIKit
import RxCocoa

final class CharacterVM : BaseVM {
    
    var characterList = PublishSubject<[RMCharacter]>()
    
    var bag : DisposeBag = DisposeBag()
    
    func fetchCharacter(){
        NetworkManager.shared.fetchRickAndMortieCharacter().subscribe(onNext: { response in
            self.characterList.onNext(response.results)
            print(response.results)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
    
}

