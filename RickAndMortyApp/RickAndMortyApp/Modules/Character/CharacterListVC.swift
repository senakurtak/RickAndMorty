//
//  CharacterListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import RxSwift
import RxCocoa

final class CharacterListVC: BaseVC<CharacterVM>  {
    
    private let characterListView = CharacterListView()
    
    var bag = DisposeBag()
    
//
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchCharacter()
        title = "Character"
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
    
    
    
}
