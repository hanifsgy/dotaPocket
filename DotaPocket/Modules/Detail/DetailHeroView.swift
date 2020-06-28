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
  var header: HeaderImageNode
  var content: ContentHeroNode
  var similiar: SimiliarNode

  init() {
    self.header = HeaderImageNode()
    self.content = ContentHeroNode(data: HeroStats.dummy)
    self.similiar = SimiliarNode(data: ["1","2"])
    super.init(node: ASDisplayNode())
    self.node.automaticallyManagesSubnodes = true
    self.node.backgroundColor = UIColor.white
    node.layoutSpecBlock = {_,_ in
      let stack = ASStackLayoutSpec(direction: .vertical,
      spacing: 0.0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [self.header, self.content, self.similiar])
      stack.style.flexGrow = 1.0
      stack.style.flexShrink = 1.0
      return stack
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.configure(with: .transparent)
  }
}

extension DetailHeroView: DetailHeroPresenterToView {
  func setupView(model: HeroStats) {
    header.configure(data: model.img ?? "")
    content = ContentHeroNode(data: model)
  }
}
