//
//  CardNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

public class CardNode: ASCellNode {
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
  private var model: HeroStats?
  // MARK: - Init
  override init() {
//    self.model = model
    super.init()
    self.selectionStyle = .none
    self.automaticallyManagesSubnodes = true
    backgroundColor = UIColor.black
  }
  
  public override func didLoad() {
    super.didLoad()
    self.layer.borderColor = Color.primaryBlack.cgColor
    self.layer.borderWidth = 1.0
    self.layer.cornerRadius = 4.0
  }
  // MARK: - Spec Layout
  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let heroDimension: CGFloat = constrainedSize.max.width / 3.0 - 4.0
    heroImage.style.preferredSize = CGSize(width: heroDimension, height: heroDimension)
    let insets = UIEdgeInsets(top: .infinity,
                              left: 4.0,
                              bottom: 8.0,
                              right: 4.0)
    let textInsetSpec = ASInsetLayoutSpec(insets: insets, child: heroName)
    return ASOverlayLayoutSpec(child: heroImage, overlay: textInsetSpec)
  }
}
