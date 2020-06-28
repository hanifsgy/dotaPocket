public struct DetailHeroModel {
  public var name: String?
  public var primaryAttribute: PrimaryAttribute?
  public var attackType: AttackType?
  public var roles: [String]?
  public var image: String?
  public var icon: String?
  
  public init() {
    self.name = nil
    self.primaryAttribute = nil
    self.attackType = nil
    self.roles = nil
    self.image = nil
    self.icon = nil
  }
  
  public static var dummy: DetailHeroModel {
    return DetailHeroModel()
  }
}

