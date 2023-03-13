//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import Foundation

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }

}

