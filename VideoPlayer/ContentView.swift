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
                DeviceInterface.shared.driveScreen(to: .landscapeLeft)
            }
            .sheet(isPresented: $isPushed ) {
                MoviePlayView()}
        }
    }
}


struct MoviePlayView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack{
                VideoPlayer(player: MoviePlayer.shared.player)
                    .onAppear() {
                        MoviePlayer.shared.play()
                    }.onDisappear() {
                        MoviePlayer.shared.pause()
                    }.edgesIgnoringSafeArea(.all)
            }
            Button("画面を閉じる") {
                DeviceInterface.shared.driveScreen(to: .portrait)
                dismiss()
            }
        }
    }
}

