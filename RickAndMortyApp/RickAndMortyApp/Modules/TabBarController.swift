//
//  TabBarController.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {

        super.viewDidLoad()

        let firstVC = HomeVC()
        let secondVC = SavedVC()

        self.setViewControllers([firstVC, secondVC], animated: true)
        firstVC.title = "Home"
        firstVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        secondVC.title = "Favorites"

        secondVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 0)

        self.tabBar.barTintColor = UIColor(red: (13/255), green: (37/255), blue: (63/255), alpha: 0.0)
    }
}
