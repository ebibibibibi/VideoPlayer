//
//  ContentView.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/27.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var isPushed: Bool = false
    var body: some View {
        VStack {
            Button("Movieを再生する"){
                isPushed.toggle()
                MoviePlayer.shared.driveScreen(to: .landscapeLeft)
            }
            .sheet(isPresented: $isPushed ) {
                MoviePlayView()}
        }
    }
}


struct MoviePlayView: View {
    @Environment(\.dismiss) var dismiss
    private let player = AVPlayer(url: Bundle.main.url(forResource: "girlSings", withExtension: "mp4")!)
    var body: some View {
        VStack {
            HStack{
                VideoPlayer(player: player)
                    .onAppear() {
                        self.player.play()
                    }.onDisappear() {
                        self.player.pause()
                    }.edgesIgnoringSafeArea(.all)
            }
            Button("画面を閉じる") {
                MoviePlayer.shared.driveScreen(to: .portrait)
                dismiss()
            }
        }
    }
}

class MoviePlayer: UIViewController{
    static let shared: MoviePlayer = MoviePlayer()
    
    func driveScreen(to direction: UIInterfaceOrientation) {
        UIDevice.current.setValue(direction.rawValue, forKey: "orientation")
    }
    
}
