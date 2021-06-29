//
//  HomeView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import SwiftUI
import SDWebImageSwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var isNavigationBarHidden: Bool = true
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = colorScheme == .dark ? .black : .white
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: colorScheme == .dark ? UIColor.white : UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: colorScheme == .dark ? UIColor.white : UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
       
        NavigationView {
            ScrollView {
                HeroCardRow().environmentObject(vm)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

struct HeroCardRow: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        VStack(spacing: -50.0) {
            ForEach(vm.heroService.allHeroes) { hero in
                WebImage(url: URL(string: URLHeader + hero.img!))
                    .resizable()
                    .frame(width: 300, height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                    .rotation3DEffect(
                        .radians(.pi / 9),
                        axis: (x: -1.0, y: 0.0, z: 0.0),
                        anchor: .top,
                        perspective: 1
                    )
                    .scaleEffect(1)
                    .offset(y: 10)
                    .zIndex(2)
                    .opacity(1)
                    .shadow(radius: 5)
                    .onTapGesture {
                        //   self.selectCard = mode
                    }
            }
        }
    }
}
