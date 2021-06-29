//
//  Dota2ShowApp.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/27.
//

import SwiftUI

@main
struct Dota2ShowApp: App{
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.black)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.black)]
        UINavigationBar.appearance().tintColor = UIColor(Color.black)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(vm)

                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
