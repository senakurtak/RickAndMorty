//
//  EpisodeDetailListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class EpisodeDetailListVC: BaseVC<EpisodeDetailVM>{
        
    var episodeItems : [RMEpisode]?
    let customNavBar = CustomNavigationBar()
    var detailedEpsId: Int?
    var detailedEpsName: String?
    var detailedEpsAir_date: String?
    var detailedEpsEpisode: String?
    var detailedEpsCharacters: [String] = [""]
    var detailedEpsUrl: String?
    var detailedEpsCreated: String?
    
    let stackView = UIStackView()
    
    public var episodeNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 36, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var episodeAirDateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var episodeEpisodeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var episodeCharactersFiveLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pewter
        if let episode = episodeItems?.first {
            detailedEpsId = episode.id
            detailedEpsName = episode.name
            detailedEpsAir_date = episode.air_date
            detailedEpsEpisode = episode.episode
            detailedEpsCharacters = episode.characters
            detailedEpsUrl = episode.url
            detailedEpsCreated = episode.created
        }
        view.addSubviews(customNavBar)
        episodeNameLabelSetUp()
        episodeAirDateLabelSetUp()
        episodeEpisodeLabelSetUp()
        episodeCharactersFiveLabelSetUp()
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }

    func episodeNameLabelSetUp(){
        view.addSubview(episodeNameLabel)
        episodeNameLabel.text = detailedEpsName
        episodeNameLabel.textAlignment = .center
        episodeNameLabel.adjustsFontSizeToFitWidth = true
        episodeNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        episodeNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        episodeNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func episodeAirDateLabelSetUp(){
        view.addSubview(episodeAirDateLabel)
        episodeAirDateLabel.text = detailedEpsAir_date
        episodeAirDateLabel.textAlignment = .right
        episodeAirDateLabel.adjustsFontSizeToFitWidth = true
        episodeAirDateLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 50).isActive = true
        episodeAirDateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        episodeAirDateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func episodeEpisodeLabelSetUp(){
        view.addSubview(episodeEpisodeLabel)
        episodeEpisodeLabel.text = detailedEpsEpisode
        episodeEpisodeLabel.textAlignment = .left
        episodeEpisodeLabel.adjustsFontSizeToFitWidth = true
        episodeEpisodeLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 50).isActive = true
        episodeEpisodeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        episodeEpisodeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func episodeCharactersFiveLabelSetUp(){
        view.addSubview(episodeCharactersFiveLabel)
        var eps = detailedEpsEpisode!
        episodeCharactersFiveLabel.text = "Top 5 Character in \(eps)"
        episodeCharactersFiveLabel.textAlignment = .left
        episodeCharactersFiveLabel.adjustsFontSizeToFitWidth = true
        episodeCharactersFiveLabel.topAnchor.constraint(equalTo: episodeEpisodeLabel.bottomAnchor, constant: 30).isActive = true
        episodeCharactersFiveLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        episodeCharactersFiveLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }

    func stackViewSetUp(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: episodeCharactersFiveLabel.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
    
    func addButtonsToStackView(){
                
        for i in 0...4{
            let button = SurveyButton()
            button.setTitle("\(String(describing: episodeItems![i].name))", for: .normal)
            stackView.addArrangedSubview(button)
        }
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
