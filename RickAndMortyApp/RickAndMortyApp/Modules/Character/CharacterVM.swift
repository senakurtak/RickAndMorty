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
//            print(response.results)
//            print(String(response.results.first?.image ?? "uppps! no image"))
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
    
    //        let viewModel = CharacterCVCVM(characterName: "Sena", characterStatus: .dead, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
    //        cell.configure(with: viewModel)
    //        return cell
    //    }

}

//extension CharacterVM: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 20
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: CharacterCVC.cellIdentifier,
//            for: indexPath
//        ) as? CharacterCVC else {
//            fatalError("unsupported cell")
//        }
//        
//        let viewModel = CharacterCVCVM(characterName: "Sena", characterStatus: .dead, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
//        cell.configure(with: viewModel)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let bounds = UIScreen.main.bounds
//        let width = (bounds.width-30)/2
//        return CGSize(width: width, height: width*1.5)
//    }
//}
