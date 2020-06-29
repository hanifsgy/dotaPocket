//
//  TagContentNode.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 29/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class TagContentNode: ASCollectionNode {
  var data: [String]
  var presenter: MainViewToPresenter?
  
  init(data: [String]) {
    self.data = data
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
    
    self.contentInset = UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
    self.style.width = ASDimensionMake("100")
    self.style.height = ASDimensionMake(52.0)
    self.delegate = self
    self.dataSource = self
    self.view.showsHorizontalScrollIndicator = false
  }
  
  func config(data: [String]) {
    self.data = data
    self.reloadData()
  }
}

extension TagContentNode: ASCollectionDataSource, ASCollectionDelegate {
  func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
    return 1
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    guard data.count > indexPath.row else { return { ASCellNode() }}
    let text = data[indexPath.row]
    let cellNodeBlock = { () -> ASCellNode in
      return TagNodeCell(data: text)
    }
    return cellNodeBlock
  }
}
