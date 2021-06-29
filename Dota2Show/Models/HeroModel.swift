//
//  HeroModel.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import Foundation

let URLHeader = "https://steamcdn-a.akamaihd.net"
let URL_Hero = "https://api.opendota.com/api/heroes"

struct HeroModel: Codable {
    let id: Int?
    let name, localizedName, img, icon: String?
    let proWin, proPick, heroID, proBan: Int?
    let the1_Pick, the1_Win, the2_Pick, the2_Win: Int?
    let the3_Pick, the3_Win, the4_Pick, the4_Win: Int?
    let the5_Pick, the5_Win, the6_Pick, the6_Win: Int?
    let the7_Pick, the7_Win, the8_Pick, the8_Win: Int?
    let turboPick, turboWin: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case img, icon
        case proWin = "pro_win"
        case proPick = "pro_pick"
        case heroID = "hero_id"
        case proBan = "pro_ban"
        case the1_Pick = "1_pick"
        case the1_Win = "1_win"
        case the2_Pick = "2_pick"
        case the2_Win = "2_win"
        case the3_Pick = "3_pick"
        case the3_Win = "3_win"
        case the4_Pick = "4_pick"
        case the4_Win = "4_win"
        case the5_Pick = "5_pick"
        case the5_Win = "5_win"
        case the6_Pick = "6_pick"
        case the6_Win = "6_win"
        case the7_Pick = "7_pick"
        case the7_Win = "7_win"
        case the8_Pick = "8_pick"
        case the8_Win = "8_win"
        case turboPick = "turbo_pick"
        case turboWin = "turbo_win"
    }
}
