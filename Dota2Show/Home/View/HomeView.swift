//
//  HomeView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    init() {
        
    }
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .frame(width: UIScreen.main.bounds.width, height: 1000)
        .edgesIgnoringSafeArea(.all)
        .background(Color.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
