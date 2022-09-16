//
//  SensorSub.swift
//  SensorGame
//
//  Created by cmStudent on 2022/08/15.
//

import CoreMotion
import Combine
import Foundation
import SwiftUI

class LenticulationManager: ObservableObject {
    
    @Published var nnn = "スタート"
    @Published var count = 0
    @Published var isTimerRunning = false
    @Published var mamo = ""
    @Published var gazo = "kk"
    
    private let motionManager = CMMotionManager()
    
    let Sound = SoundPlayer()
    
    private let baseDegrees = 60
    
    init() {
        if motionManager.isDeviceMotionAvailable {
            startUpdatingLenticulation()
            startCounting()
            Sound.amahaPlay()
        }
    }
    
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [self] _ in
                self.count += 1
                
            }
    }
                    
    public func startUpdatingLenticulation() {
       
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (deviceMotion, error) in
            guard let deviceMotion = deviceMotion,
                  error == nil
            else {
                return
            }
            let degree = deviceMotion.attitude.roll.convertedRadianToDegree()
            let degree2 = deviceMotion.attitude.pitch.convertedRadianToDegree()
            let degree3 = deviceMotion.attitude.yaw.convertedRadianToDegree()
            
           
            
            
            if (degree > 15 || degree < -15) {
                self.nnn = "負け"
                self.gazo = "bad"
                return
            } else if(degree == 0) {
                self.nnn = "かち"
                self.gazo = "bad"
                return
            } else if(degree2 > 15 || degree2 < -15) {
                self.nnn = "負け"
                self.gazo = "bad"
                return
            } else if(degree2 == 0) {
                self.nnn = "かち"
                return
            }else if(degree3 > 15 || degree3 < -15) {

                self.nnn = "負け"
                self.gazo = "bad"
                return
            } else if(degree3 == 0) {
                self.nnn = "かち"
                return

            }
            
            
            if(self.count == 10) {
                self.nnn = "勝ち"
                self.gazo = "yaya"
               
            }
            
          
         
        }
    }
}
