//
//  VideoViewModel.swift
//  VideoPlayer
//
//  Created by kotomi tahkahashi on 2022/08/29.
//

import AVKit

class MoviePlayer: NSObject {
    static let shared: MoviePlayer = MoviePlayer()
    var moviePlayer: AVPlayer?
    
    // スタート
    func setMovie(movieName: String) {
        let moviePath = Bundle.main.path(forResource: movieName, ofType: "mp4") ?? Bundle.main.path(forResource: "noMovieFile", ofType: "mp4")!
        let movieUrl = URL(fileURLWithPath: moviePath)
        moviePlayer = AVPlayer(url: movieUrl)
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
