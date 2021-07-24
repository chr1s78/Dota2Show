//
//  ListView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/17.
//

import SwiftUI

struct ListView: View {
    
    @Binding var hero: [HeroBasicElement]//HeroBasic
//    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                if let hero = hero {
                    ForEach( hero ) { data in
                        ListRowView(item: data)
                    }
                } else {
                    Text("获取英雄数据出错 :(")
                }
                
            }
            .padding()
        }
    }
}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
