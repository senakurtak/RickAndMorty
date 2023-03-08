//
//  DeviceSize.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 8.03.2023.
//

import Foundation
import UIKit

// we create a accessible function 

var screenWidth = CGFloat()
var screenHeight = CGFloat()

func getDeviceSize(){
    screenWidth = UIScreen.main.bounds.width
    screenHeight = UIScreen.main.bounds.height
}
