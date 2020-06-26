//
//  CardNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

public class CardNode: ASCollectionNode {
  // Hero Text
  lazy var heroName: ASTextNode = {
    let text = ASTextNode()
    text.maximumNumberOfLines = 2
    text.placeholderEnabled = true
    return text
  }()
  // Hero Image
  lazy var heroImage: ASNetworkImageNode = {
    let image = ASNetworkImageNode()
    image.placeholderEnabled = true
    image.clipsToBounds = true
    image.style.flexGrow = 1.0
    image.placeholderColor = Color.placeholderColor
    return image
  }()
  // MARK: - Spec Layout
  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let heroDimension: CGFloat = constrainedSize.max.width / 2.0
    heroImage.style.preferredSize = CGSize(width: heroDimension, height: heroDimension)
    let insets = UIEdgeInsets(top: .infinity,
                              left: 8.0,
                              bottom: 8.0,
                              right: 8.0)
    let textInsetSpec = ASInsetLayoutSpec(insets: insets, child: heroName)
    return ASOverlayLayoutSpec(child: heroImage, overlay: textInsetSpec)
  }
}
