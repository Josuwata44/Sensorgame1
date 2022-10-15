//
//  Sound2.swift
//  SensorGame
//
//  Created by cmStudent on 2022/10/15.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    
    let amahaDate = NSDataAsset(name: "pk")!.data
    var amahaPlayer: AVAudioPlayer!
    
    func amahaPlay() {
        do {
            amahaPlayer = try AVAudioPlayer(data: amahaDate)
            amahaPlayer.play()
        } catch {
            print("エラーが発生しました！")
        }
    }
   
    func stop2() {
        amahaPlayer.stop()
    }
    
    func reset() {
        amahaPlayer.currentTime = 0
    }
    
}


