//
//  Button.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 13.03.2023.
//

import Foundation
import UIKit

class SurveyButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(){
        setTitleColor(.white, for: .normal)
        backgroundColor = .orgDarkGray
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 28)
        layer.cornerRadius = 10
    }
}
