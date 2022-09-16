//
//  setumei.swift
//  SensorGame
//
//  Created by cmStudent on 2022/09/14.
//

import SwiftUI

struct setumei: View {
    @StateObject var lenticulationManager = LenticulationManager()
    var body: some View {
        NavigationView {
            ZStack{
                Image("Image")
                    .resizable()
                    .frame(width: 370.0, height: 900.0)
            VStack(spacing: 10){
            Text("ゲームの説明")
                .font(.largeTitle)
                .foregroundColor(Color.red)
              
            Text("このゲームは様々な動きに対してスマホを傾けないようにするゲームです。")
                    .foregroundColor(Color.red)
                
                  
            Text("1、まずiphineの画面を上に向けて傾けないように持ってください。")
                    .foregroundColor(Color.red)
                   
            Text("2、１０秒間の間にその場で一回転回ってもらい傾かなかったら勝ちです。傾いたら負けです")
                    .foregroundColor(Color.red)
                
                
            Text("３、勝っても傾けない方がいいかも...........")
                    .foregroundColor(Color.red)
               NavigationLink(destination: ContentView()) {
                   Image("btn")
                       .resizable()
                       .frame(width: 300.0, height: 300.0)
               }
                    
               }
           }
        }
    }
}

struct setumei_Previews: PreviewProvider {
    static var previews: some View {
        setumei()
    }
}
