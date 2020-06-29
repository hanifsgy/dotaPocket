//
//  SimiliarNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class SimiliarNode: ASDisplayNode {
  
  lazy var similiarText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  
  lazy var image: ASNetworkImageNode = {
    let image = ASNetworkImageNode()
    image.placeholderEnabled = true
    image.clipsToBounds = true
    return image
  }()
  
  lazy var similiarHeroText: ASTextNode = {
    let text = ASTextNode()
    return text
  }()
  private var data: [String] = []
  
  init(data: [String]) {
    super.init()
    self.data = data
    self.automaticallyManagesSubnodes = true
    similiarText.attributedText = NSAttributedString.bold("Similiar", size: 32.0, color: Color.primaryBlack)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let overlay = ASOverlayLayoutSpec(child: image, overlay: similiarHeroText)
    let stack = ASStackLayoutSpec(direction: .vertical,
                                  spacing: 4.0,
                                  justifyContent: .start,
                                  alignItems: .stretch,
                                  children: [similiarText])
    return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), child: stack)
  }
}
