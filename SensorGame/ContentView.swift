//
//  ContentView.swift
//  SensorGame
//
//  Created by cmStudent on 2022/08/15.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    
    @StateObject var lenticulationManager = LenticulationManager()
    let Sound = SoundPlayer()
    
    var body: some View {
        ZStack {
         Image("bb")
                .resizable()
                .frame(width: 1000.0, height: 1000.0)
        VStack {
            Text("\(lenticulationManager.count)")
                .foregroundColor(Color.red)
            Image(lenticulationManager.gazo)
                .font(.largeTitle)
            Text(lenticulationManager.nnn)
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }
            HStack {
                
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
