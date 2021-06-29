//
//  HomeViewModel.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @ObservedObject var heroService = HeroService()
 //   @ObservedObject var allHeroes: [HeroModel]
    
    init() {
        heroService.getHeroes()
    }
    
    func isHeroesAvailble() -> Bool {
        print(heroService.allHeroes.count)
        return (heroService.allHeroes.count > 0) ? true : false
    }
    

    func getHeroChineseName(name: String) -> String {
        return ""
    }
    
    func getHeroImageURL(image: String) -> URL? {
        guard let url = URL(string: image) else { return nil }
        return url
    }
}
