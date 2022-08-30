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
        moviePlayer?.pause()
        
        let moviePath = Bundle.main.path(forResource: movieName, ofType: "mp4") ?? Bundle.main.path(forResource: "noMovieFile", ofType: "mp4")!
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
        print(self.moviePlayer)
        moviePlayer?.play()
    }
    // 一時停止
    func pause() {
        moviePlayer?.pause()

    }
    
}
