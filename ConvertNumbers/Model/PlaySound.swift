//
//  PlaySound.swift
//  ConvertNumbers
//
//  Created by 杉原大貴 on 2020/09/14.
//  Copyright © 2020 杉原大貴. All rights reserved.
//

import AVFoundation
import UIKit

class PlaySound {
    
    let path: String
    let player: AVPlayer
    
    init(sourceName: String, sourceType: String) {
        self.path = Bundle.main.path(forResource: sourceName, ofType: sourceType)!
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
    }
    
    func play() {
        player.play()
    }

}
