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
    @State var show: Bool = false
    
    init() {
    }
    
    var body: some View {
       
        ZStack {
            
            LottieView(filename: "magic")
                .background(
                    Image("jugg")
                        .resizable()
                        .opacity(0.8)
                )
                .edgesIgnoringSafeArea(.all)

            
            
            ScrollView(showsIndicators: false) {
                HeroCardRow().environmentObject(vm)
            }
            .frame(width: UIScreen.main.bounds.width)
            .offset(x: 30)
            
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
    @State var selectHero: HeroModel? = nil
  // @State var isSheet: Bool = false
    
    /// 计算ScrollView中image的缩放系数
    func getParaCurveScale(currentY: CGFloat) -> CGFloat {

        if currentY == 0.4 {
            return 1.1
        }
        else {
            return CGFloat(currentY <= 0.4 ? currentY*0.5 + 0.8 : 1.2 - currentY*0.5)
        }
    }
    
    var body: some View {
        
        VStack(spacing: -60.0) {
            
            ForEach(vm.allHeroes) { hero in
                //ForEach(0..<20) { hero in
                WebImage(url: URL(string: URLHeader + hero.img!))
                    // Image("axe_full")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 17.0))
                    .rotation3DEffect(
                        Angle(degrees: 40),
                        axis: (x: 1.0, y: -1.0, z: 0),
                        anchor: .center,
                        perspective: 1
                    )
                    .zIndex(2)
                    .shadow(color: Color.black.opacity(0.8), radius: 20, x: 0, y: 10)
                    .opacity(1)
                    .scaleEffect(0.9)
                    .onTapGesture {
                        self.selectHero = hero
                        print("hero: \(String(describing: self.selectHero))")
                    }
            }
        }
        .frame(width: 500)
        .sheet(item: self.$selectHero, content: { heros in
            HeroSheetView(hero: heros)
        })
    }
}
