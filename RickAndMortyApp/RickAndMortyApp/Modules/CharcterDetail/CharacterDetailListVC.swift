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
    
    
    public var chrNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 36, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var chrStatusLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var chrSpecies : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var chrGender : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var chrOrigin : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var chrLocation : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pewter
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
        view.addSubview(customNavBar)
        chrNameLabelSetUp()
        chrStatusLabelSetUp()
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
    func chrNameLabelSetUp(){
        view.addSubview(chrNameLabel)
        chrNameLabel.text = detailedChrName
        chrNameLabel.textAlignment = .center
        chrNameLabel.adjustsFontSizeToFitWidth = true
        chrNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        chrNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        chrNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func chrStatusLabelSetUp(){
        view.addSubview(chrStatusLabel)
        chrNameLabel.text = detailedChrStatus?.rawValue
        chrNameLabel.textAlignment = .left
        chrNameLabel.adjustsFontSizeToFitWidth = true
        chrNameLabel.topAnchor.constraint(equalTo: chrNameLabel.bottomAnchor, constant: 50).isActive = true
        chrNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        chrNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        chrNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
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
