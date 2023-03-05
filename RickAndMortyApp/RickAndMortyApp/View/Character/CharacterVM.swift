//
//  CharacterVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//
import Moya
import RxSwift
import UIKit

class CharacterVM : ObservableObject {
 
    var characterList = PublishSubject<RMCharacterResponse>()
    
    var bag : DisposeBag = DisposeBag()
    
    func fetchCharacter(){
        NetworkManager.shared.fetchRickAndMortieCharacter().subscribe(onNext: { response in
            self.characterList.onNext(response)
            print(self.characterList)
            print(response)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }}
