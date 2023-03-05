//
//  LocationVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = LocationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        viewModel.fetchLocation()
        
    }
}
