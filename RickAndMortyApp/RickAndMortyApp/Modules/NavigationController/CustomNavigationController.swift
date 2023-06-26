////
////  CustomNavigationController.swift
////  RickAndMortyApp
////
////  Created by Sena Kurtak on 10.03.2023.
////
//
// import UIKit
//
// class CustomNavigationController: UINavigationController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Customize the appearance of the navigation bar
//        navigationBar.tintColor = .white
//        navigationBar.barTintColor = .black
//        navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.white
//        ]
//        
//    }
//    
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        // Set the back button title for the new view controller
//        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
//        viewController.navigationItm.backBarButtonItem = backButton
//        // Call the superclass method to push the new view controller onto the stack
//        super.pushViewController(viewController, animated: animated)
//    }
// }
