//
//  ContentView.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/27.
//

import SwiftUI
import AVKit
import UIKit

struct ContentView: View {
    @State var isPushed: Bool = false
    var body: some View {
        NavigationView(){
            VStack {
                NavigationLink(isActive: $isPushed) {
                    MoviePlayView()
                } label: {
                    EmptyView()
                }
                Button("Movie", action: {
                    self.isPushed.toggle()
                    MoviePlayer.shared.setMovie(movieName: "00001")
                })
            }
            .onAppear() {
                print("にゃ?")
                UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKeyPath: "orientation")
                print("u\(UIDevice.current.orientation.rawValue)にゃ")
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(.stack)
    }
}


struct MoviePlayView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            PlayerViewController()
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    MoviePlayer.shared.play()
                    UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKeyPath: "orientation")
                    print("🧸\(UIDevice.current.orientation.rawValue)🧸")
                    print("にゃん")
                    
                }.onDisappear() {
                    print("🍓\(UIDevice.current.orientation.rawValue)")
                    UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKeyPath: "orientation")
                    print("🍓\(UIDevice.current.orientation.rawValue)")
                    MoviePlayer.shared.pause()
                }
        }
    }
}

class ViewController: UIHostingController< ContentView > {
    var window: UIWindow?
    let hostingController = UIHostingController(rootView: ContentView())
    
    
    override dynamic func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        print("🧸")
        
    }
}

extension UINavigationController {
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            get {
                if let visibleVC = visibleViewController {
                    return visibleVC.supportedInterfaceOrientations
                }
                return super.supportedInterfaceOrientations
            }
        }
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
}
