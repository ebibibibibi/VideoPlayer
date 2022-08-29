//
//  MoviePlayer.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/29.
//

import Foundation
import UIKit

class DeviceInterface: UIViewController{
    static let shared: DeviceInterface = DeviceInterface()
    
    func driveScreen(to direction: UIInterfaceOrientation) {
        UIDevice.current.setValue(direction.rawValue, forKey: "orientation")
    }
    
}
