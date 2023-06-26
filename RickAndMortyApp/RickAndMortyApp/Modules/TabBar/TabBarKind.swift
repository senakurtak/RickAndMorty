//
//  TabBarKind.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

enum TabBarKind: Int {
    case character
    case location
    case episode

    var title: String? {
        switch self {
        case .character:
            return "Character"
        case .location:
            return "Location"
        case .episode:
            return "Episode"
        }
    }
    var icon: UIImage? {
        switch self {
        case .character:
            return UIImage(systemName: "person")
        case .location:
            return UIImage(systemName: "globe")
        case .episode:
            return UIImage(systemName: "tv")
        }
    }

    var navigationController: UINavigationController {
        let nav = UINavigationController()
        nav.tabBarItem.title = self.title
        nav.tabBarItem.image = self.icon
        return nav
    }

    static var items: [TabBarKind] {
        return [.character, .location, .episode]
    }
}
