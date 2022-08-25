//
//  SensorSub.swift
//  SensorGame
//
//  Created by cmStudent on 2022/08/15.
//

import CoreMotion
import CoreGraphics

class LenticulationManager: ObservableObject {
    
    @Published var nnn = "スタート"
    
    private let motionManager = CMMotionManager()
    
    private let baseDegrees: CGFloat = 60
    
    init() {
        if motionManager.isDeviceMotionAvailable {
            startUpdatingLenticulation()
            
        }
    }
    
    private func startUpdatingLenticulation() {
       
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (deviceMotion, error) in
            guard let deviceMotion = deviceMotion,
                  error == nil
            else {
                return
                
            }
           
            let degree = deviceMotion.attitude.roll.convertedRadianToDegree()
            
           
            
            if(degree > 10) {
                self.nnn = "負け"
            }
            
            if(degree == 0) {
                self.nnn = "かち"
            }
            
            let degree2 = deviceMotion.attitude.pitch.convertedRadianToDegree()
            
            if(degree2 > 10) {
                self.nnn = "負け"
                
            }
            
            if(degree2 == 0) {
                self.nnn = "かち"
            }
            
            let degree3 = deviceMotion.attitude.yaw.convertedRadianToDegree()
            
         
            if(degree3 > 10) {
                self.nnn = "負け"
            }
            
            if(degree3 == 0) {
                self.nnn = "かち"
            }
        }
    }
}



