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
    
    static let instance = HeroService()
    
    @Published var allHeroes: [HeroModel] = []
    @Published var allHeroesBasic: HeroBasic = []
    @Published var isHeroReady: Bool = false
    @Published var isHeroBasicReady: Bool = false
    @Published var isReceiveAllReady: Bool = false
    
    var heroSubscription: AnyCancellable?
    var HeroBasicSubscription: AnyCancellable?
    var receiveSubscription: AnyCancellable?
    
    let didChange = PassthroughSubject<HeroService,Never>()
    let willChange = PassthroughSubject<HeroService,Never>()

    private init() {
        getHeroes()
        getHeroesBasic()
        
        receiveSubscription = isReceiveComplete
            .receive(on: RunLoop.main)
            .assign(to: \.isReceiveAllReady, on: self)
    }
    
    func getHeroes() {
        guard let url = URL(string: URL_HeroState) else { return }

        heroSubscription = NetworkingManager.download(url: url)
            .decode(type: [HeroModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allHeroes = returnedCoins
                self?.isHeroReady = true
                self?.heroSubscription?.cancel()
                print("isHeroReady : " + (self?.isHeroReady.description)!)
                
             //   print(self?.allHeroes as Any)
            })
    }
    
    func getHeroesBasic() {
        guard let url = URL(string: URL_HeroBasic) else { return }

        HeroBasicSubscription = NetworkingManager.download(url: url)
            .decode(type: HeroBasic.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (heroes) in
                self?.allHeroesBasic = heroes
                self?.isHeroBasicReady = true
                self?.HeroBasicSubscription?.cancel()
                print("isHeroBasicReady : " + (self?.isHeroBasicReady.description)!)
               // print(self?.allHeroesBasic as Any)
            })
    }
    
    /// 组合两个publisher <isHeroReady: 英雄状态是否接收完成, isHeroBasicReady: 英雄基本信息是否接收完成>
    private var isReceiveComplete: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($isHeroReady, $isHeroBasicReady)
            .map {
                if $0 == true && $1 == true {
                    print(" ****** both true *********")
                    return true
                } else {
                    return false
                }
            }
            .eraseToAnyPublisher()
    }

}

