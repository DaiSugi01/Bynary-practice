//
//  PlayMovie.swift
//  ConvertNumbers
//
//  Created by 杉原大貴 on 2020/09/14.
//  Copyright © 2020 杉原大貴. All rights reserved.
//

import UIKit
import AVFoundation

class PlayMovie: PlaySound {
        
    private var observers: (player: NSObjectProtocol,
    willEnterForeground: NSObjectProtocol,
    bounds: NSKeyValueObservation)?

    var view: UIView
    
    init(sourceName: String, sourceType: String, view: UIView) {
        self.view = view
        super.init(sourceName: sourceName, sourceType: sourceType)
    }

    deinit {
        // 画面が破棄された時に監視をやめる
        if let observers = observers {
            NotificationCenter.default.removeObserver(observers.player)
            NotificationCenter.default.removeObserver(observers.willEnterForeground)
            observers.bounds.invalidate()
        }
    }

    override func play() {
        player.actionAtItemEnd = .none
        super.play()
    }
//    
//    func createLayer(){
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = view.bounds
//        playerLayer.videoGravity = .resizeAspectFill
//        playerLayer.zPosition = -2 // 次に追加するoverlayより後ろにする
//        view.layer.insertSublayer(playerLayer, at: 0)
//        
//        // 動画の上に重ねる半透明の黒いレイヤー
//        dimOverlay.frame = view.bounds
//        dimOverlay.backgroundColor = UIColor.black.cgColor
//        dimOverlay.zPosition = -1
//        dimOverlay.opacity = 0.6 // 不透明度
//        view.layer.insertSublayer(dimOverlay, at: 0)
//        
//        observe(playerLayer: playerLayer)
//    }
//    
//    func observe(playerLayer: AVPlayerLayer) {
//        // 最後まで再生したら最初から再生する
//        let playerObserver = NotificationCenter.default.addObserver(
//            forName: .AVPlayerItemDidPlayToEndTime,
//            object: player.currentItem,
//            queue: .main) { [weak playerLayer] _ in
//                playerLayer?.player?.seek(to: CMTime.zero)
//                playerLayer?.player?.play()
//        }
//
//        // アプリがバックグラウンドから戻ってきた時に再生する
//        let willEnterForegroundObserver = NotificationCenter.default.addObserver(
//            //            forName: .UIApplicationWillEnterForeground,
//            forName: UIApplication.willEnterForegroundNotification,
//            object: nil,
//            queue: .main) { [weak playerLayer] _ in
//                playerLayer?.player?.play()
//        }
//
//        // 端末が回転した時に動画レイヤーのサイズを調整する
//        let boundsObserver = view.layer.observe(\.bounds) { [weak playerLayer, weak dimOverlay] view, _ in
//            DispatchQueue.main.async {
//                playerLayer?.frame = view.bounds
//                dimOverlay?.frame = view.bounds
//            }
//        }
//
//        observers = (playerObserver, willEnterForegroundObserver, boundsObserver)
//
//    }

}
