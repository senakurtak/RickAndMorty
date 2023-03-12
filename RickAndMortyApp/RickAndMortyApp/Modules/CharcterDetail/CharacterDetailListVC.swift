//
//  CharacterDetailListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class CharacterDetailListVC: BaseVC<CharacterDetailVM>{
    
    private let characterDetailListView = CharacterDetailListView()
    
    var characters : [RMCharacter]?
    
    let customNavBar = CustomNavigationBar()
    
    var detailedChrId: Int?
    var detailedChrName: String?
    var detailedChrStatus: RMCharacterStatus?
    var detailedChrSpecies: String?
    var detailedChrType: String?
    var detailedChrGender: String?
    var detailedChrOrigin: RMOrigin?
    var detailedChrLocation: RMSingleLocation?
    var detailedChrImage: String?
    var detailedChrEpisode: [String] = [""]
    var detailedChrUrl: String?
    var detailedChrCreated: String?
    
    
    public var idLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print(characters)
        if let character = characters?.first{
            detailedChrId = character.id
            detailedChrName = character.name
            detailedChrStatus = character.status
            detailedChrSpecies = character.species
            detailedChrType = character.type
            detailedChrGender = character.gender
            detailedChrOrigin = character.origin
            detailedChrLocation = character.location
            detailedChrImage = character.image
            detailedChrEpisode = character.episode
            detailedChrUrl = character.url
            detailedChrCreated = character.created
        }
        print("Selected Character Details are: \(detailedChrId),\(detailedChrName),\(detailedChrStatus),\(detailedChrSpecies),\(detailedChrType),\(detailedChrGender),\(detailedChrOrigin),\(detailedChrLocation),\(detailedChrImage),\(detailedChrEpisode),\(detailedChrUrl),\(detailedChrCreated)")
        
        view.addSubviews(customNavBar)
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Layout custom navigation bar
        let customNavBarSize = CGSize(width: view.bounds.width, height: 88)
        customNavBar.frame = CGRect(origin: CGPoint(x: 0, y: view.safeAreaInsets.top), size: customNavBarSize)
    }
    
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
