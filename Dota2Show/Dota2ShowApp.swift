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
    @State private var showLaunchView: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.black)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.black)]
        UINavigationBar.appearance().tintColor = UIColor(Color.black)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
//                NavigationView {
//                    HomeView()
//                        .navigationBarHidden(true)
//                }
//                .navigationViewStyle(StackNavigationViewStyle())
//                .environmentObject(vm)

                ZStack {
                    NavigationView {
                        if !showLaunchView {
                            LaunchView(showLaunchView: $showLaunchView)
                                .navigationBarTitle("", displayMode: .inline)
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)
                                .environmentObject(vm)
                                .transition(.move(edge: .leading))
                        }
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                }
                .zIndex(2.0)
            }
        }
    }
}
