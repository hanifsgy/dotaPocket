//
//  MainView.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

class MainView: ASViewController<ASDisplayNode> {
  // MARK: - Properties
  var presenter: MainViewToPresenter?
  var context: ASBatchContext?
  private var disposeBag: DisposeBag = DisposeBag()
  private var contentNode: ContentNode
  private var contentTagNode: TagContentNode
  
  init() {
    self.contentNode = ContentNode(data: HeroStats.dummyContent())
    self.contentTagNode = TagContentNode(data: [])
    super.init(node: ASDisplayNode())
    self.node.backgroundColor = .white
    self.node.automaticallyManagesSubnodes = true
    self.node.layoutSpecBlock = {_,_ in
      let stack = ASStackLayoutSpec(direction: .vertical,
                                    spacing: 0,
                                    justifyContent: .start,
                                    alignItems: .stretch,
                                    children: [self.contentTagNode, self.contentNode])
      return stack
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.fetchData()
    self.contentNode.presenter = presenter
    self.contentTagNode.presenter = presenter
  }
  // MARK: - ViewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.configure(with: .solid(color: Color.primaryBlack))
    addNavBarImage()
  }
}

extension MainView: MainPresenterToView {
  func refreshContentTags(items: [String]) {
    self.contentTagNode.config(data: items)
  }
  
  func refreshContentNode(items: [HeroStats]) {
    self.contentNode.config(data: items)
  }
  
  func showLoading() {
    
  }
  
  func dismissLoading() {
    
  }
}

extension MainView {
  // MARK: - Add Navigation Bar Image
  func addNavBarImage() {
    let navController = navigationController!
    let image = UIImage(named: "dota-2-logo")
    let imageView = UIImageView(image: image)
    let bannerWidth = navController.navigationBar.frame.size.width
    let bannerHeight = navController.navigationBar.frame.size.height
    let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
    let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
    imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
  }
  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }
}
