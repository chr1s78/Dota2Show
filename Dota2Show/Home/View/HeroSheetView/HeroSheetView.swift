//
//  HeroSheetView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/6.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeroSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let hero: HeroModel
 //   var coloredNavAppearance = UINavigationBarAppearance()
    
    /// @State是optional时的写法 " Binding<HeroModel?>? "
    init(hero: HeroModel) {
        self.hero = hero
        print("receive hero: \(hero)")
        
        /// 改变NavigationView背景色和前景色
//        coloredNavAppearance.configureWithOpaqueBackground()
//        coloredNavAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }

    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.5)
            
            VStack {
                
                WebImage(url: URL(string: URLHeader + hero.img!))
                    //       Image("axe_full")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                
                Text(hero.localizedName ?? "unknown hero")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    .foregroundColor(.white)
                
                HStack {
                    Text("职业比赛")
                        .foregroundColor(.white).bold()
                    Text("BAN率: " + String(self.hero.proBan ?? 0) )
                        .foregroundColor(.red)
                    Text("选率: " + String(self.hero.proPick ?? 0) )
                        .foregroundColor(.green).bold()
                    Text("胜率: " + String(self.hero.proWin ?? 0) )
                        .foregroundColor(.yellow).bold()
                    
                }
                .font(.subheadline)
                
                Spacer()
                
                Text("test")
                
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color.black.opacity(0.5))
        }
        .edgesIgnoringSafeArea(.all)

    }
    
}

struct HeroSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSheetView(hero: (HeroModel(id: 1, name: "Unknown", localizedName: "hero name", img: "/apps/dota2/images/heroes/abaddon_full.png?", icon: "", proWin: 0, proPick: 0, heroID: 0, proBan: 0, the1_Pick: 0, the1_Win: 0, the2_Pick: 0, the2_Win: 0, the3_Pick: 0, the3_Win: 0, the4_Pick: 0, the4_Win: 0, the5_Pick: 0, the5_Win: 0, the6_Pick: 0, the6_Win: 0, the7_Pick: 0, the7_Win: 0, the8_Pick: 0, the8_Win: 0, turboPick: 0, turboWin: 0)))
    }
}
