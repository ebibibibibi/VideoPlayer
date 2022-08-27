//
//  ContentView.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/27.
//

import SwiftUI
import AVKit

struct ContentView: View {
    // play river.mp4
    private let player = AVPlayer(url: Bundle.main.url(forResource: "girlSings", withExtension: "mp4")!)

    var body: some View {
        HStack{
            VideoPlayer(player: player)
            .onAppear() {
                self.player.play()
            }.onDisappear() {
                self.player.pause()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
