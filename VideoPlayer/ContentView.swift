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
        ZStack {
            PlayerViewController()
                    .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    MoviePlayer.shared.play()
                }.onDisappear() {
                    MoviePlayer.shared.pause()
                }
                
            VStack {
                HStack {
                Image(systemName: "xmark.circle").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color.white)
                    .padding()
                    .onTapGesture() {
                        DeviceInterface.shared.driveScreen(to: .portrait)
                        dismiss()
                    }
                    Spacer()
                }
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack(spacing: 40) {
                    Image(systemName: "pause.circle").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color.white)
                        .onTapGesture() {
                            MoviePlayer.shared.pause()
                        }
                    Image(systemName: "play.circle").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color.white)
                        .onTapGesture() {
                            MoviePlayer.shared.play()
                        }
                }
                .padding()
            }.frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    
    struct PlayerViewController: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> AVPlayerViewController {
            MoviePlayer.shared.setMovie(movieName: "girlSings")
            let player = MoviePlayer.shared.moviePlayer
            let controller =  AVPlayerViewController()
            controller.modalPresentationStyle = .fullScreen
            controller.player = player
            controller.videoGravity = .resizeAspectFill
            controller.showsPlaybackControls = false
            return controller
        }
        
        func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
            //none
        }
        
    }
