//
//  DetailHeroView.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class DetailHeroView: ASViewController<ASDisplayNode> {
  var presenter: DetailHeroViewToPresenter?
  var header: HeaderImageNode?
  var content: ContentHeroNode?
  var similiar: SimiliarNode?
  
   init(node: ASDisplayNode, data: DetailHeroModel) {
    super.init(node: node)
    content = ContentHeroNode(data: data)
    if let image = data.image, let roles = data.roles {
      header = HeaderImageNode(urlImage: image)
      similiar = SimiliarNode(data: roles)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
}

extension DetailHeroView: DetailHeroPresenterToView {
  func setupView() {
    
  }
}
