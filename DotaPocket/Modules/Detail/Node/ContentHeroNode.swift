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
    return image
  }()
  
  lazy var attackText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var armorIcon: ASImageNode = {
    let image = ASImageNode()
    return image
  }()
  
  lazy var armorText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var movementIcon: ASImageNode = {
    let image = ASImageNode()
    return image
  }()
  
  lazy var movementText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var healthIcon: ASImageNode = {
    let image = ASImageNode()
    return image
  }()
  
  lazy var healthText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var manaIcon: ASImageNode = {
    let image = ASImageNode()
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
  init(data: DetailHeroModel) {
    super.init()
    automaticallyManagesSubnodes = true
  }
  // MARK: - Spec Layout
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let stackAttack: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                           spacing: 4.0,
                                                           justifyContent: .start,
                                                           alignItems: .start,
                                                           children: [attackIcon, attackText])
    let stackHealth: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                           spacing: 4.0,
                                                           justifyContent: .start,
                                                           alignItems: .start,
                                                           children: [healthIcon, healthText])
    let stackArmor: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                          spacing: 4.0,
                                                          justifyContent: .start,
                                                          alignItems: .start,
                                                          children: [armorIcon, armorText])
    let stackMana: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                         spacing: 4.0,
                                                         justifyContent: .start,
                                                         alignItems: .start,
                                                         children: [manaIcon, manaText])
    let stackMovement: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                             spacing: 4.0,
                                                             justifyContent: .start,
                                                             alignItems: .start,
                                                             children: [movementIcon, movementText])
    let stackAttribute: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                              spacing: 4.0,
                                                              justifyContent: .start,
                                                              alignItems: .start,
                                                              children: [primaryAttributeIcon, primaryAttributeText])
    let stackOne: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                        spacing: 16.0,
                                                        justifyContent: .spaceAround,
                                                        alignItems: .stretch,
                                                        children: [stackAttack, stackHealth])
    let stackTwo: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                        spacing: 16.0,
                                                        justifyContent: .spaceAround,
                                                        alignItems: .stretch,
                                                        children: [stackArmor, stackMana])
    let stackThree: ASStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                          spacing: 16.0,
                                                          justifyContent: .spaceAround,
                                                          alignItems: .stretch,
                                                          children: [stackMovement, stackAttribute])
    let stackContent: ASStackLayoutSpec = ASStackLayoutSpec(direction: .vertical,
                                                              spacing: 8.0,
                                                              justifyContent: .start,
                                                              alignItems: .stretch,
                                                              children: [heroStatsText, stackOne, stackTwo, stackThree])
    return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16.0,
                                                  left: 16.0,
                                                  bottom: 16.0,
                                                  right: 16.0), child: stackContent)
  }
}
