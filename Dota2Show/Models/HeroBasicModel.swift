//
//  HeroBasicModel.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/18.
//

import Foundation
let URL_HeroBasic = "https://api.opendota.com/api/heroes"

///
struct HeroBasicElement: Codable, Identifiable {
    let id: Int?
    let name, localizedName: String?
    let primaryAttr: PrimaryAttr?
    let attackType: AttackType?
    let roles: [Role]?
    let legs: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, legs
    }
}

enum AttackType: String, Codable {
    case melee = "Melee"
    case ranged = "Ranged"
}

enum PrimaryAttr: String, Codable {
    case agi = "agi"
    case int = "int"
    case str = "str"
}

enum Role: String, Codable {
    case carry = "Carry"
    case disabler = "Disabler"
    case durable = "Durable"
    case escape = "Escape"
    case initiator = "Initiator"
    case jungler = "Jungler"
    case nuker = "Nuker"
    case pusher = "Pusher"
    case support = "Support"
}

typealias HeroBasic = [HeroBasicElement]
