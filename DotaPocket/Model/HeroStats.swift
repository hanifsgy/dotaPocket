//
//  HeroStats+CoreDataClass.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation
import CoreData

//typealias HeroStatsResponse = [HeroStats]
//
//public class HeroStats: NSManagedObject, Codable {
//
//  @NSManaged var id: Int
//  @NSManaged var name: String?
//  @NSManaged var localizedName: String?
//  @NSManaged var primaryAttr: String?
//  @NSManaged var attackType: String?
//  @NSManaged var roles: [String]?
//  @NSManaged var img: String?
//  @NSManaged var icon: String?
//  @NSManaged var baseHealth: Int
//  @NSManaged var baseHealthRegen: Double
//  @NSManaged var baseMana: Int
//  @NSManaged var baseManaRegen: Double
//  @NSManaged var baseArmor: Int
//  @NSManaged var baseMr: Int
//  @NSManaged var baseAttackMin: Int
//  @NSManaged var baseAttackMax: Int
//  @NSManaged var baseStr: Int
//  @NSManaged var baseAgi: Int
//  @NSManaged var baseInt: Int
//  @NSManaged var strGain: Double
//  @NSManaged var agiGain: Double
//  @NSManaged var intGain: Double
//  @NSManaged var attackRange: Int
//  @NSManaged var projectileSpeed: Int
//  @NSManaged var attackRate: Int
//  @NSManaged var moveSpeed: Int
//  @NSManaged var turnRate: Double
//  @NSManaged var cmEnabled: Bool
//
//  // MARK: - Encodable
//  public func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//    do {
//      try container.encode(id, forKey: .id)
//      try container.encode(name, forKey: .name)
//      try container.encode(localizedName, forKey: .localizedName)
//      try container.encode(primaryAttr, forKey: .primaryAttr)
//      try container.encode(attackType, forKey: .attackType)
//      try container.encode(roles, forKey: .roles)
//      try container.encode(img, forKey: .img)
//      try container.encode(icon, forKey: .icon)
//      try container.encode(baseHealth, forKey: .baseHealth)
//      try container.encode(baseHealthRegen, forKey: .baseHealthRegen)
//      try container.encode(baseMana, forKey: .baseMana)
//      try container.encode(baseManaRegen, forKey: .baseManaRegen)
//      try container.encode(baseArmor, forKey: .baseArmor)
//      try container.encode(baseMr, forKey: .baseMr)
//      try container.encode(baseAttackMin, forKey: .baseAttackMin)
//      try container.encode(baseAttackMax, forKey: .baseAttackMax)
//      try container.encode(baseStr, forKey: .baseStr)
//      try container.encode(baseAgi, forKey: .baseAgi)
//      try container.encode(baseInt, forKey: .baseInt)
//      try container.encode(strGain, forKey: .strGain)
//      try container.encode(agiGain, forKey: .agiGain)
//      try container.encode(intGain, forKey: .intGain)
//      try container.encode(attackRange, forKey: .attackRange)
//      try container.encode(projectileSpeed, forKey: .projectileSpeed)
//      try container.encode(attackRange, forKey: .attackRange)
//      try container.encode(moveSpeed, forKey: .moveSpeed)
//      try container.encode(turnRate, forKey: .turnRate)
//      try container.encode(cmEnabled, forKey: .cmEnabled)
//    }
//  }
//
//  // MARK: - Decodable
//  required convenience public init(from decoder: Decoder) throws {
//    //    guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
//    //      let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
//    //      let entity = NSEntityDescription.entity(forEntityName: "HeroStats", in: managedObjectContext) else {
//    //        fatalError("Failed to decode HeroStats")
//    //    }
//    guard let contextUserInfoKey = CodingUserInfoKey.managedObjectContext else { fatalError("cannot find context key")}
//    guard let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext else { fatalError("cannot retrieve context")}
//    guard let entity = NSEntityDescription.entity(forEntityName: "HeroStats", in: managedObjectContext) else { fatalError("cannot find entity")}
//
//    self.init(entity: entity, insertInto: nil)
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.id = try container.decode(Int.self, forKey: .id)
//    self.name = try container.decodeIfPresent(String.self, forKey: .name)
//    self.localizedName = try container.decodeIfPresent(String.self, forKey: .localizedName)
//    self.primaryAttr = try container.decodeIfPresent(String.self, forKey: .primaryAttr)
//    self.attackType = try container.decodeIfPresent(String.self, forKey: .attackType)
//    self.roles = try container.decodeIfPresent([String].self, forKey: .roles)
//    self.img = try container.decodeIfPresent(String.self, forKey: .img)
//    self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
//    self.baseHealth = try container.decodeIfPresent(Int.self, forKey: .baseHealth) ?? 0
//    self.baseHealthRegen = try container.decodeIfPresent(Double.self, forKey: .baseHealthRegen) ?? 0.0
//    self.baseMana = try container.decodeIfPresent(Int.self, forKey: .baseMana) ?? 0
//    self.baseManaRegen = try container.decodeIfPresent(Double.self, forKey: .baseManaRegen) ?? 0.0
//    self.baseArmor = try container.decodeIfPresent(Int.self, forKey: .baseArmor) ?? 0
//    self.baseMr = try container.decodeIfPresent(Int.self, forKey: .baseMr) ?? 0
//    self.baseAttackMin = try container.decodeIfPresent(Int.self, forKey: .baseAttackMin) ?? 0
//    self.baseAttackMax = try container.decodeIfPresent(Int.self, forKey: .baseAttackMax) ?? 0
//    self.baseStr = try container.decodeIfPresent(Int.self, forKey: .baseStr) ?? 0
//    self.baseAgi = try container.decodeIfPresent(Int.self, forKey: .baseAgi) ?? 0
//    self.baseInt = try container.decodeIfPresent(Int.self, forKey: .baseInt) ?? 0
//    self.strGain = try container.decodeIfPresent(Double.self, forKey: .strGain) ?? 0.0
//    self.agiGain = try container.decodeIfPresent(Double.self, forKey: .agiGain) ?? 0.0
//    self.intGain = try container.decodeIfPresent(Double.self, forKey: .intGain) ?? 0.0
//    self.attackRange = try container.decodeIfPresent(Int.self, forKey: .attackRange) ?? 0
//    self.moveSpeed = try container.decodeIfPresent(Int.self, forKey: .moveSpeed) ?? 0
//    self.turnRate = try container.decodeIfPresent(Double.self, forKey: .turnRate) ?? 0.0
//    self.cmEnabled = try container.decode(Bool.self, forKey: .cmEnabled)
//  }
//
//  enum CodingKeys: String, CodingKey {
//    case id, name, roles, img, icon, legs
//    case localizedName = "localized_name"
//    case primaryAttr = "primary_attr"
//    case attackType = "attack_type"
//    case baseHealth = "base_health"
//    case baseHealthRegen = "base_health_regen"
//    case baseMana = "base_mana"
//    case baseManaRegen = "base_mana_regen"
//    case baseArmor = "base_armor"
//    case baseMr = "base_mr"
//    case baseAttackMin = "base_attack_min"
//    case baseAttackMax = "base_attack_max"
//    case baseStr = "base_str"
//    case baseAgi = "base_agi"
//    case baseInt = "base_int"
//    case strGain = "str_gain"
//    case agiGain = "agi_gain"
//    case intGain = "int_gain"
//    case attackRange = "attack_range"
//    case projectileSpeed = "projectile_speed"
//    case attackRate = "attack_rate"
//    case moveSpeed = "move_speed"
//    case turnRate = "turn_rate"
//    case cmEnabled = "cm_enabled"
//  }
//
//}
//
//extension CodingUserInfoKey {
//  static let managedObjectContext = CodingUserInfoKey(rawValue: "context")
//}

//extension JSONDecoder {
//  convenience init(context: NSManagedObjectContext) {
//    self.init()
//    self.userInfo[.managedObjectContext] = context
//  }
//}

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
