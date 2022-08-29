//
//  VideoViewModel.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/29.
//

import AVKit

class MoviePlayer: NSObject {
    static let shared: MoviePlayer = MoviePlayer()
    let player = AVPlayer(url: Bundle.main.url(forResource: "girlSings", withExtension: "mp4")!)
    private var moviePlayer: AVPlayer?
    
    // スタート
    func setMovie(movieName: String) {
        moviePlayer?.pause()
        
        let moviePath = Bundle.main.path(forResource: movieName, ofType: "mp4") ?? Bundle.main.path(forResource: "noMusicFile", ofType: "mp4")!
        let movieUrl = URL(fileURLWithPath: moviePath)
        do {
            moviePlayer = try AVPlayer(url: movieUrl)
        } catch let error as NSError {
            print("Error \(error.localizedDescription)")
            moviePlayer = nil
        }
    }
    // スタート
    func play() {
        moviePlayer?.play()
    }
    // 一時停止
    func pause() {
        moviePlayer?.pause()

    }
    
}
