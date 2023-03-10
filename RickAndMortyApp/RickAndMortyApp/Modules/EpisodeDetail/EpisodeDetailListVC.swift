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
    
    var episodeItems : [RMEpisode] = []    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        print(episodeItems.first)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapToBack))
        
    }
    
    @objc func didTapToBack(){
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else  {
            self.dismiss(animated: true)
        }
    }
}
