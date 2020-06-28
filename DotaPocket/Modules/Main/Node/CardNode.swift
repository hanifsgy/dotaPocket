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
    image.contentMode = .scaleAspectFill
    return image
  }()
  private var model: HeroStats?
  // MARK: - Init
  init(model: HeroStats) {
    self.model = model
    super.init()
    self.selectionStyle = .none
    self.automaticallyManagesSubnodes = true
    if let image = model.img {
      heroImage.setURL(URL(string: "https://api.opendota.com" + image), resetToDefault: true)
    }
    heroName.attributedText = NSAttributedString.semiBold(model.localizedName ?? "", size: 14.0, color: UIColor.white)
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
    let overlayBlack = ASDisplayNode()
    overlayBlack.backgroundColor = Color.primaryBlack.withAlphaComponent(0.5)
    overlayBlack.style.preferredSize = CGSize(width: heroDimension, height: 24)
    let overlaySpecHero = ASOverlayLayoutSpec(child: heroImage, overlay: overlayBlack)
    return ASOverlayLayoutSpec(child: overlaySpecHero, overlay: textInsetSpec)
  }
}
