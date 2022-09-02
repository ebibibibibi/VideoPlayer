//
//  MoviePlayer.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/29.
//

import UIKit
import SwiftUI
import AVKit

struct PlayerViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let player = MoviePlayer.shared.moviePlayer
        let controller =  AVPlayerViewController()
        print("🐶")
        controller.player = player
        controller.modalPresentationStyle = .fullScreen
        controller.videoGravity = .resizeAspect
        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
