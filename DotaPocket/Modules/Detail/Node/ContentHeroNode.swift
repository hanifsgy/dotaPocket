//
//  ContentHeroNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class ContentHeroNode: ASDisplayNode {
  
  lazy var roleText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var heroStatsText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var attackIcon: ASImageNode = {
    let image = ASImageNode()
    image.image = UIImage(named: "knight")
    return image
  }()
  
  lazy var attackText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var armorIcon: ASImageNode = {
    let image = ASImageNode()
    image.image = UIImage(named: "shield")
    return image
  }()
  
  lazy var armorText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var movementIcon: ASImageNode = {
    let image = ASImageNode()
    image.image = UIImage(named: "boots")
    return image
  }()
  
  lazy var movementText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var healthIcon: ASImageNode = {
    let image = ASImageNode()
    image.image = UIImage(named: "heart")
    return image
  }()
  
  lazy var healthText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var manaIcon: ASImageNode = {
    let image = ASImageNode()
    image.image = UIImage(named: "poison")
    return image
  }()
  
  lazy var manaText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var primaryAttributeIcon: ASImageNode = {
    let image = ASImageNode()
    return image
  }()
  
  lazy var primaryAttributeText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  // MARK: - Initialize
  init(data: HeroStats) {
    super.init()
    automaticallyManagesSubnodes = true
    [attackIcon, armorIcon, movementIcon,
     healthIcon, manaIcon, primaryAttributeIcon].forEach { (image) in
      image.style.preferredSize = CGSize(width: 21, height: 21)
      image.contentMode = .center
    }
    [attackText, armorText, movementText,
     healthText, manaText, primaryAttributeText].forEach { (text) in
      text.style.flexGrow = 1.0
      text.style.flexShrink = 1.0
    }
    attackText.attributedText = NSAttributedString.semiBold("\(data.baseAttackMin) - \(data.baseAttackMax)",
      size: 14.0, color: Color.primaryBlack)
    healthText.attributedText = NSAttributedString.semiBold("\(data.baseHealth)", size: 14.0, color: Color.primaryBlack)
    armorText.attributedText = NSAttributedString.semiBold("\(data.baseArmor ?? 0)", size: 14.0, color: Color.primaryBlack)
    manaText.attributedText = NSAttributedString.semiBold("\(data.baseMana)", size: 14.0, color: Color.primaryBlack)
    movementText.attributedText = NSAttributedString.semiBold("\(data.moveSpeed)", size: 14.0, color: Color.primaryBlack)
    if let icon = PrimaryAttribute(rawValue: data.primaryAttr ?? "") {
      primaryAttributeIcon.image = UIImage(named: icon.image)
    }
    primaryAttributeText.attributedText = NSAttributedString.semiBold("\(data.primaryAttr ?? "")", size: 14.0, color: Color.primaryBlack)
    if let roles = data.roles {
      var text: [String] = []
      for role in roles {
        text.append(role)
      }
      heroStatsText.attributedText = NSAttributedString.bold(text.joined(separator: ", "), size: 20.0, color: Color.primaryBlack)
    }
    roleText.attributedText = NSAttributedString.bold("Roles", size: 32.0, color: Color.primaryBlack)
  }
  // MARK: - Spec Layout
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let stackAttack: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                           spacing: 4.0,
                                                           justifyContent: .start,
                                                           alignItems: .stretch,
                                                           children: [attackIcon, attackText])
    let stackHealth: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                           spacing: 4.0,
                                                           justifyContent: .start,
                                                           alignItems: .stretch,
                                                           children: [healthIcon, healthText])
    let stackArmor: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                          spacing: 4.0,
                                                          justifyContent: .start,
                                                          alignItems: .stretch,
                                                          children: [armorIcon, armorText])
    let stackMana: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                         spacing: 4.0,
                                                         justifyContent: .start,
                                                         alignItems: .stretch,
                                                         children: [manaIcon, manaText])
    let stackMovement: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                             spacing: 4.0,
                                                             justifyContent: .start,
                                                             alignItems: .stretch,
                                                             children: [movementIcon, movementText])
    let stackAttribute: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                              spacing: 4.0,
                                                              justifyContent: .start,
                                                              alignItems: .stretch,
                                                              children: [primaryAttributeIcon, primaryAttributeText])
    let stackOne: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                        spacing: 16.0,
                                                        justifyContent: .start,
                                                        alignItems: .stretch,
                                                        children: [stackAttack, stackHealth])
    let stackTwo: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                        spacing: 42.0,
                                                        justifyContent: .start,
                                                        alignItems: .start,
                                                        children: [stackArmor, stackMana])
    let stackThree: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                          spacing: 42.0,
                                                          justifyContent: .start,
                                                          alignItems: .stretch,
                                                          children: [stackMovement, stackAttribute])
    let stackContent: ASStackLayoutSpec = ASStackLayoutSpec(direction: .vertical,
                                                            spacing: 8.0,
                                                            justifyContent: .center,
                                                            alignItems: .stretch,
                                                            children: [roleText, heroStatsText, stackOne, stackTwo, stackThree])
    return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16.0,
                                                  left: 16.0,
                                                  bottom: 16.0,
                                                  right: 16.0), child: stackContent)
  }
}
