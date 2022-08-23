//
//  SensorSub.swift
//  SensorGame
//
//  Created by cmStudent on 2022/08/15.
//

import CoreMotion
import CoreGraphics

class LenticulationManager: ObservableObject {
    
    @Published var middleImageOpacity: CGFloat = 1
    @Published var frontImageOpacitry: CGFloat = 0
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
            
            let attitudeState = DeviceAttitudeState(degree)
            // 姿勢の状態に応じてImageOpacityの値を更新
            self.updateImageOpacity(with: attitudeState)
            
            if(degree > 10) {
                self.nnn = "負け"
            }
            
            if(degree == 0) {
                self.nnn = "かち"
            }
            
            let degree2 = deviceMotion.attitude.pitch.convertedRadianToDegree()
            
            let attitudeState2 = DeviceAttitudeState(degree2)
            // 姿勢の状態に応じてImageOpacityの値を更新
            self.updateImageOpacity2(with: attitudeState2)
            
            if(degree2 > 10) {
                self.nnn = "負け"
                
            }
            
            if(degree2 == 0) {
                self.nnn = "かち"
            }
            
            let degree3 = deviceMotion.attitude.yaw.convertedRadianToDegree()
            
            let attitudeState3 = DeviceAttitudeState(degree3)
            
        
            self.updateImageOpacity3(with: attitudeState3)
            
            if(degree3 > 10) {
                self.nnn = "負け"
            }
            
            if(degree3 == 0) {
                self.nnn = "かち"
            }
            
        }
    }
    
    
    private func updateImageOpacity(with attributeState: DeviceAttitudeState) {
        
        switch attributeState {
        case .flat:
            update(middleImageOpacity: 1, andFrontImageOpacity: 0)
        case .forward(let degree):
            let frontOpacity = degree >= baseDegrees ?  1 : degree / baseDegrees
            update(middleImageOpacity: 1, andFrontImageOpacity: frontOpacity)
        case .backward(let degree):
            let middleOpacity = degree >= baseDegrees ?  0 : (baseDegrees - degree) / baseDegrees
            update(middleImageOpacity: middleOpacity, andFrontImageOpacity: 0)
        }
    }
    
    private func updateImageOpacity2(with attributeState2: DeviceAttitudeState) {
        
        switch attributeState2 {
        case .flat:
            update(middleImageOpacity: 1, andFrontImageOpacity: 0)
        case .forward(let degree):
            let frontOpacity = degree >= baseDegrees ?  1 : degree / baseDegrees
            update(middleImageOpacity: 1, andFrontImageOpacity: frontOpacity)
        case .backward(let degree):
            let middleOpacity = degree >= baseDegrees ?  0 : (baseDegrees - degree) / baseDegrees
            update(middleImageOpacity: middleOpacity, andFrontImageOpacity: 0)
        }
    }
    
    private func updateImageOpacity3(with attributeState3: DeviceAttitudeState) {
        
        switch attributeState3 {
        case .flat:
            update(middleImageOpacity: 1, andFrontImageOpacity: 0)
        case .forward(let degree):
            let frontOpacity = degree >= baseDegrees ?  1 : degree / baseDegrees
            update(middleImageOpacity: 1, andFrontImageOpacity: frontOpacity)
        case .backward(let degree):
            let middleOpacity = degree >= baseDegrees ?  0 : (baseDegrees - degree) / baseDegrees
            update(middleImageOpacity: middleOpacity, andFrontImageOpacity: 0)
        }
    }
    
    
    
    private func update(middleImageOpacity: CGFloat,
                        andFrontImageOpacity frontImageOpacty: CGFloat) {
        self.middleImageOpacity = middleImageOpacity
        self.frontImageOpacitry = frontImageOpacty
    }
}

extension LenticulationManager {
    
    enum DeviceAttitudeState {
        case flat
        case forward(degree: Double)
        case backward(degree: Double)
        
        init(_ degree: Double) {
            
            switch degree {
            case 1...180:
                self = .forward(degree: degree)
            case -180 ... -1:
                let positiveDegree = degree * -1
                self = .backward(degree: positiveDegree)
            default:
                self = .flat
            }
        }
    }
}

