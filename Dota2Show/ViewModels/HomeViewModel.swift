//
//  HomeViewModel.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var heroService = HeroService()
    
    init() {
        heroService.getHeroes()
    }
    
}
