//
//  CharacterVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import UIKit

class CharacterVC: BaseVC<CharacterVM> {

    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomCell")
        viewModel?.fetchCharacter()
        title = "Characters"
    }
}
