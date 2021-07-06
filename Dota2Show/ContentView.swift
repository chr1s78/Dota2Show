//
//  ContentView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/27.
//

import SwiftUI

struct ContentView: View {
    
    var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    
    init() {
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(loadingText.indices) { index in
                Text(loadingText[index])
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
                    .offset(y: counter == index ? -5 : 0)
            }
        }
        .transition(AnyTransition.scale.animation(.easeIn))
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                      //  showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
