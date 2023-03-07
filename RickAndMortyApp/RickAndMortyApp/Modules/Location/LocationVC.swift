//
//  LocationVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import UIKit

class LocationVC: BaseVC<LocationVM> {

    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "LocationTVC", bundle: nil), forCellReuseIdentifier: "LocationTVC")
        viewModel?.fetchLocation()
        title = "Locations"
    }
}
