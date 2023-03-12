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
    
    private let episodeDetailListView = EpisodeDetailListView()
    
    var episodeItems : [RMEpisode]?
    let customNavBar = CustomNavigationBar()
    var detailedEpsId: Int?
    var detailedEpsName: String?
    var detailedEpsAir_date: String?
    var detailedEpsEpisode: String?
    var detailedEpsCharacters: [String] = [""]
    var detailedEpsUrl: String?
    var detailedEpsCreated: String?
    
    
    public var idLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        if let episode = episodeItems?.first{
//            title = episode.name
            detailedEpsId = episode.id
            detailedEpsName = episode.name
            detailedEpsAir_date = episode.air_date
            detailedEpsEpisode = episode.episode
            detailedEpsCharacters = episode.characters
            detailedEpsUrl = episode.url
            detailedEpsCreated = episode.created
        }
        print("Selected Episode Details are \(detailedEpsId),\(detailedEpsName),\(detailedEpsAir_date),\(detailedEpsEpisode),\(detailedEpsCharacters) ,\(detailedEpsUrl),\(detailedEpsCreated),")
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
