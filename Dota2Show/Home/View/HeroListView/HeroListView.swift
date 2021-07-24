//
//  HeroListView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/17.
//

import SwiftUI

struct HeroListView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    var tmpData: HeroBasic = []
    @State var data: HeroBasic = []
    
    init() {
    }
    
    var body: some View {
        CustomNavigationView(view: AnyView(ListView(hero: $vm.allHeroesBasic)), placeHolder: "名称,属性,类型", largeTitle: false, title: "英雄列表", onSearch: { txt in

            // filtering Data
            if txt != "" {
                self.data = tmpData.filter{
                    $0.name!.lowercased().contains(txt.lowercased())
                }
            } else {
                self.data = tmpData
            }
        }, onCancel: {
            // Do you own code when search and canceled
            self.data = tmpData
        })
        .ignoresSafeArea()
    }
}

struct HeroListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroListView()
    }
}
