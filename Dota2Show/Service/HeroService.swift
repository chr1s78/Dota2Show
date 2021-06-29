//
//  HeroService.swift
//  Dota2Show
//
//  Mark: 获取英雄信息服务
//  Created by 吕博 on 2021/6/29.
//

import Foundation
import Combine
import SwiftUI


class HeroService: ObservableObject {
    
    @Published var allHeroes: [HeroModel] = []
    
    var heroSubscription: AnyCancellable?
    
    init() {
        getHeroes()
    }
    
    func getHeroes() {
        guard let url = URL(string: URL_Hero) else { return }

        heroSubscription = NetworkingManager.download(url: url)
            .decode(type: [HeroModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allHeroes = returnedCoins
                self?.heroSubscription?.cancel()
            })
    }
    
}

