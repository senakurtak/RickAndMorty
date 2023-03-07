//
//  CharacterCVCVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 7.03.2023.
//

import Foundation
// Character CollectionView ViewModel

final class CharacterCVCVM {
    
    public let characterName : String
    private let characterStatus : RMCharacterStatus
    private let characterImageUrl: URL?
    
    init(
        characterName : String,
        characterStatus : RMCharacterStatus,
        characterImageUrl: URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText : String {
        return characterStatus.rawValue
    }
    
}
