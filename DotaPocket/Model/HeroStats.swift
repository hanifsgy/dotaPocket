//
//  HeroStats+CoreDataClass.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation
import CoreData

typealias HeroStatsResponse = [HeroStats]

public struct HeroStats: Codable {
  var id: Int
  var name: String?
  var localizedName: String?
  var primaryAttr: String?
  var attackType: String?
  var roles: [String]?
  var img: String?
  var icon: String?
  var baseHealth: Int
  var baseHealthRegen: Double?
  var baseMana: Int
  var baseManaRegen: Double?
  var baseArmor: Double?
  var baseMr: Int
  var baseAttackMin: Int
  var baseAttackMax: Int
  var baseStr: Int
  var baseAgi: Int
  var baseInt: Int
  var strGain: Double?
  var agiGain: Double?
  var intGain: Double?
  var attackRange: Int
  var projectileSpeed: Int
  var attackRate: Double?
  var moveSpeed: Int
  var turnRate: Double?
  var cmEnabled: Bool
  
  enum CodingKeys: String, CodingKey {
    case id, name, roles, img, icon
    case localizedName = "localized_name"
    case primaryAttr = "primary_attr"
    case attackType = "attack_type"
    case baseHealth = "base_health"
    case baseHealthRegen = "base_health_regen"
    case baseMana = "base_mana"
    case baseManaRegen = "base_mana_regen"
    case baseArmor = "base_armor"
    case baseMr = "base_mr"
    case baseAttackMin = "base_attack_min"
    case baseAttackMax = "base_attack_max"
    case baseStr = "base_str"
    case baseAgi = "base_agi"
    case baseInt = "base_int"
    case strGain = "str_gain"
    case agiGain = "agi_gain"
    case intGain = "int_gain"
    case attackRange = "attack_range"
    case projectileSpeed = "projectile_speed"
    case attackRate = "attack_rate"
    case moveSpeed = "move_speed"
    case turnRate = "turn_rate"
    case cmEnabled = "cm_enabled"
  }
  
  public static var dummy: HeroStats {
    return HeroStats(id: 1,
                     name: nil,
                     localizedName: nil,
                     primaryAttr: nil,
                     attackType: nil,
                     roles: nil,
                     img: nil,
                     icon: nil,
                     baseHealth: 1,
                     baseHealthRegen: nil,
                     baseMana: 1,
                     baseManaRegen: nil,
                     baseArmor: nil,
                     baseMr: 1,
                     baseAttackMin: 1,
                     baseAttackMax: 1,
                     baseStr: 1,
                     baseAgi: 1,
                     baseInt: 1,
                     strGain: nil,
                     agiGain: nil,
                     intGain: nil,
                     attackRange: 1,
                     projectileSpeed: 1,
                     attackRate: nil,
                     moveSpeed: 1,
                     turnRate: nil,
                     cmEnabled: false)
  }
  
  public static func dummyContent() -> [HeroStats] {
    return [dummy]
  }
}

public enum HeroRoles: String, CaseIterable {
  case carry = "Carry"
  case escape = "Escape"
  case nuker = "Nuker"
  case initiator = "Initiator"
  case durable = "Durable"
  case disabler = "Disabler"
  case jungler = "Jungler"
  case pusher = "Pusher"
  
  static var item: [String] {
    return HeroRoles.allCases.map { $0.rawValue }
  }
}

public enum PrimaryAttribute: String {
  case agi
  case str
  case int
  
  var image: String {
    switch self {
    case .agi:
      return "rocket"
    case .str:
      return "strong"
    case .int:
      return "protest"
    }
  }
}

public enum AttackType: String {
  case melee = "Melee"
  case ranged = "Ranged"
}
