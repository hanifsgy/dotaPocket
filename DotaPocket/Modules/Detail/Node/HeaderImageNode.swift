//
//  HeaderImageNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class HeaderImageNode: ASDisplayNode {
  
  lazy var image: ASNetworkImageNode = {
    let image = ASNetworkImageNode()
    image.placeholderEnabled = true
    image.clipsToBounds = true
    return image
  }()
  
  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
  }
  
  func configure(data: String) {
    image.setURL(URL(string: "https://api.opendota.com" + data), resetToDefault: true)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let imageDimension: CGFloat = constrainedSize.max.width
    image.style.preferredSize = CGSize(width: imageDimension, height: 352)
    return ASWrapperLayoutSpec(layoutElement: image)
  }
}
