//
//  SplashView.swift
//  SensorGame
//
//  Created by cmStudent on 2022/09/07.
//

import SwiftUI

struct SplashView: View {
  @State var isActive = false

  var body: some View {
    VStack {
      if self.isActive {
          setumei()
      } else {
          ZStack  {
              Image("moon")
                  .resizable() // フレームいっぱいに広げる
                  .frame(width: 600, height: 800)
              VStack{
        Image("good")
              .resizable()
              .frame(width: 300.0, height: 300.0)
        Text("バランスでGO")
              .font(.largeTitle)
              }
          }
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        withAnimation {
          self.isActive = true
        }
      }
    }
  }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
