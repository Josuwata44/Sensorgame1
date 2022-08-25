//
//  ContentView.swift
//  SensorGame
//
//  Created by cmStudent on 2022/08/15.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var lenticulationManager = LenticulationManager()
    let Sound = SoundPlayer()
    let backGroundColor = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom)

    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
        VStack {
            Text(lenticulationManager.nnn)
                .font(.largeTitle)
            Text(lenticulationManager.nnn)
                
                .font(.largeTitle)
          
            
        }
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
