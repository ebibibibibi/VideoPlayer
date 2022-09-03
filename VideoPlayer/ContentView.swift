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
            .onAppear {
                print("u\(UIDevice.current.orientation.rawValue)にゃ")
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                AppDelegate.orientationLock = .portrait 
            }.onDisappear {
                AppDelegate.orientationLock = .all 
            }
            
            .navigationBarHidden(true)
        }.navigationViewStyle(.stack)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.portrait
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        print("u\(UIInterfaceOrientationMask.RawValue())にゃ")
        return AppDelegate.orientationLock
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

