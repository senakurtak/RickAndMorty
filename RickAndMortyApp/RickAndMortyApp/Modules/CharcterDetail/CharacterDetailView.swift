//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//

import UIKit
import RxSwift
import RxCocoa
import Foundation

class CharacterDetailListView: UIView {
    
    private let viewModel = CharacterDetailVM()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
