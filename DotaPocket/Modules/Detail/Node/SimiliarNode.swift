//
//  SimiliarNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class SimiliarNode: ASCollectionNode {
  var data: [HeroStats]
  
  init(data: [HeroStats]) {
    self.data = data
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 1.0
    layout.minimumInteritemSpacing = 1.0
    super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
    self.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    self.style.width = ASDimension(unit: .fraction, value: 1)
    self.style.height = ASDimensionMake(250)
    self.delegate = self
    self.dataSource = self
    self.view.showsHorizontalScrollIndicator = false
  }
  
  func config(data: [HeroStats]) {
    self.data = data
    DispatchQueue.main.async {
      self.reloadData()
    }
  }
}

extension SimiliarNode: ASCollectionDataSource, ASCollectionDelegate {
  func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
    return 1
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    print("similiar heroes: \(data.count)")
    return data.count
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    guard data.count > indexPath.row else { return { ASCellNode() }}
    let hero = data[indexPath.row]
    let cellNodeBlock = { () -> ASCellNode in
      return SimiliarCellNode(model: hero)
    }
    return cellNodeBlock
  }
}
// MARK: - Similiar Cell
class SimiliarCellNode: ASCellNode {
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
    heroName.attributedText = NSAttributedString.semiBold(model.localizedName ?? "", size: 25.0, color: UIColor.white)
  }
  
  public override func didLoad() {
    super.didLoad()
    self.layer.borderColor = Color.primaryBlack.cgColor
    self.layer.borderWidth = 1.0
    self.layer.cornerRadius = 4.0
  }
  // MARK: - Spec Layout
  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    heroImage.style.preferredSize = CGSize(width: 250, height: 250)
    let insets = UIEdgeInsets(top: .infinity,
                              left: 4.0,
                              bottom: 8.0,
                              right: 4.0)
    let textInsetSpec = ASInsetLayoutSpec(insets: insets, child: heroName)
    let overlayBlack = ASDisplayNode()
    overlayBlack.backgroundColor = Color.primaryBlack.withAlphaComponent(0.5)
    overlayBlack.style.preferredSize = CGSize(width: 250, height: 250)
    let overlaySpecHero = ASOverlayLayoutSpec(child: heroImage, overlay: overlayBlack)
    return ASOverlayLayoutSpec(child: overlaySpecHero, overlay: textInsetSpec)
  }
}
