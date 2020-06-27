//
//  TagNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

public class TagNodeCell: ASCellNode {
  // Tag
  lazy var tagText: ASTextNode = {
    let text = ASTextNode()
    text.maximumNumberOfLines = 1
    text.style.alignSelf = .center
    return text
  }()
  private var data: String?
  public override var isSelected: Bool {
    didSet {
      if let data = self.data {
        setSeleted(selected: isSelected, data: data)
      }
    }
  }
  
  // MARK: - Init
  public init(data: String) {
    super.init()
    self.data = data
    tagText.attributedText = NSAttributedString.regular(data, size: 12, color: Color.primaryGrey)
    backgroundColor = UIColor.white
    automaticallyManagesSubnodes = true
    self.style.width = ASDimensionMake("100")
    self.style.height = ASDimensionMake(34)
  }
  public override func didLoad() {
    super.didLoad()
    self.layer.cornerRadius = 16.0
    self.layer.borderColor = Color.primaryGrey.cgColor
    self.layer.borderWidth = 1.0
  }
  // MARK: - Spec Layout
  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let center = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: tagText)
    center.style.flexShrink = 1.0
    center.style.flexGrow = 1.0
    let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4), child: center)
    return inset
  }
  // MARK: - Selected
  private func setSeleted(selected: Bool, data: String) {
    if selected {
      tagText.attributedText = NSAttributedString.bold(data, size: 16, color: UIColor.white)
      backgroundColor = Color.primaryRed
      self.layer.borderColor = UIColor.clear.cgColor
    } else {
      tagText.attributedText = NSAttributedString.regular(data, size: 12, color: Color.primaryGrey)
      backgroundColor = UIColor.white
      self.layer.borderColor = Color.primaryGrey.cgColor
    }
  }
}
