//
//  ListRowView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/17.
//

import SwiftUI

struct ListRowView: View {
    
    var item: HeroBasicElement
    
    var body: some View {
        HStack(spacing: 15.0) {
            
            ZStack {
                Image("axe_full")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fill)
                  //  .frame(width: 120, height: 80)
                    .layoutPriority(-1)
            }
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .aspectRatio(1, contentMode: .fit)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.localizedName!)
                            .font(.title2).bold()
                        HStack {
                            Text(item.primaryAttr!.rawValue)
                                .font(.title3)
                                .fontWeight(.light)
                            Text(item.attackType!.rawValue)
                                .font(.title3)
                                .fontWeight(.light)
                        }
                        
                        HStack {
                            ForEach(item.roles!.indices) {
                                Text(self.item.roles![$0].rawValue)
                                    .font(.caption)
                                    .fontWeight(.light)
                            }
                        }
                         
                    }
                    
                    Spacer(minLength: 5)
                    
                    Image(systemName: "suit.heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                }
                
                Divider()
            }

            
        }
        .padding(.horizontal)
        
    
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: HeroBasicElement(id: 1, name: "name", localizedName: "localname", primaryAttr: .agi, attackType: .melee, roles: [.carry,.escape], legs: 2))
    }
}
