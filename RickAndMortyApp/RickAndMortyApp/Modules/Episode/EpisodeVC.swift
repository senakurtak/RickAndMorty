//
//  EpisodeVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import UIKit

class EpisodeVC: BaseVC<EpisodeVM> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomTVC")
        viewModel?.fetchEpisode()
        title = "Episode"
    }
}
