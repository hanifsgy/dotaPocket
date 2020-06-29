//
//  ContentNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 29/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class ContentNode: ASCollectionNode {
  var data: [HeroStats]
  var presenter: MainViewToPresenter?
  
  init(data: [HeroStats]) {
    self.data = data
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 1.0
    layout.minimumInteritemSpacing = 1.0
    super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
    
    self.contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
    self.style.width = ASDimension(unit: .fraction, value: 1)
    self.style.height = ASDimension(unit: .fraction, value: 1)
    self.delegate = self
    self.dataSource = self
    self.view.showsVerticalScrollIndicator = false
  }
  
  func config(data: [HeroStats]) {
    self.data = data
    DispatchQueue.main.async {
      self.reloadData()
    }
  }
}

extension ContentNode: ASCollectionDataSource, ASCollectionDelegate {
  func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
    return 1
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    guard data.count > indexPath.row else { return { ASCellNode() }}
    let hero = data[indexPath.row]
    let cellNodeBlock = { () -> ASCellNode in
      return CardNode(model: hero)
    }
    return cellNodeBlock
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
    let hero = data[indexPath.row]
    presenter?.didSelectHero(model: hero)
  }
}
