//
//  MoviePlayer.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/29.
//

import UIKit

class DeviceInterface: UIViewController {
    static let shared: DeviceInterface = DeviceInterface()
    
    /// 画面の向きを横向きにしようとしていて、
    /// かつ、　物理的な向きがdirectionで指定しようとしているUIの向きの反対だったら
    func driveScreen(to direction: UIInterfaceOrientation) {
        let noeDeviceOriention: UIDeviceOrientation = UIDevice.current.orientation
        if noeDeviceOriention.rawValue == direction.rawValue && direction.rawValue != 1 && direction.rawValue != 2 {
            return UIDevice.current.setValue(noeDeviceOriention.rawValue, forKey: "orientation")
        }
        UIDevice.current.setValue(direction.rawValue, forKey: "orientation")
    }
    
}
