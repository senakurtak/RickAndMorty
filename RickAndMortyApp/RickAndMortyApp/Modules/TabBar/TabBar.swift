//
//  TabBar.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import RxSwift

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tabBar.backgroundColor = .white
        }
        self.tabBar.tintColor = UIColor.green
    }
}

