//
//  ViewController.swift
//  RickAndMortyApplication
//
//  Created by Sena Kurtak on 27.02.2023.
//

//import UIKit
//import SideMenu
//
//class ViewController: UIViewController {
//
//    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController(with: ["Character",
//                                                                                                  "Episode",
//                                                                                                  "Location"]))
//    @IBAction func didTapMenuItem(_ sender: Any) {
//        present(sideMenu, animated: true)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        sideMenu.leftSide = true
//        SideMenuManager.default.leftMenuNavigationController = sideMenu
//        SideMenuManager.default.addPanGestureToPresent(toView: view)
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rnm")!)
//    }
//}
//
