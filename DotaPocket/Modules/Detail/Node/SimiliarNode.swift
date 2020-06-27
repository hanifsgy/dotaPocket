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
  
  var collectionSimiliar: ASCollectionNode?
  private var data: [String] = []
  
  init(data: [String]) {
    super.init()
    self.data = data
    self.automaticallyManagesSubnodes = true
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collectionSimiliar = ASCollectionNode(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 170), collectionViewLayout: layout)
    collectionSimiliar?.showsHorizontalScrollIndicator = false
    collectionSimiliar?.delegate = self
    collectionSimiliar?.dataSource = self
  }
}

extension SimiliarNode: ASCollectionDelegate {
  
}

extension SimiliarNode: ASCollectionDataSource {
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    let cellNodeBlock = { () -> ASCellNode in
      let dataHero = self.data[indexPath.row]
      let cellNode = SimiliarCellNode(data: dataHero)
      return cellNode
    }
    return cellNodeBlock
  }
}

class SimiliarCellNode: ASCellNode {
  
  lazy var image: ASNetworkImageNode = {
    let image = ASNetworkImageNode()
    return image
  }()
  
  init(data: String) {
    super.init()
    self.automaticallyManagesSubnodes = true
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    image.style.preferredSize = CGSize(width: 123, height: 123)
    return ASWrapperLayoutSpec(layoutElement: image)
  }
}
