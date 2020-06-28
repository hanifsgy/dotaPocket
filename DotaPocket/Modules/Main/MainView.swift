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
  var collectionTagNode: ASCollectionNode?
  var collectionContentNode: ASCollectionNode?
  private var tagsData: [String] = []
  private var heroStats: [HeroStats] = []
  
  override init(node: ASDisplayNode) {
    super.init(node: node)
    self.node.automaticallyManagesSubnodes = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    presenter?.fetchData()
  }
  // MARK: - ViewDidAppear
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.navigationBar.configure(with: .solid(color: Color.primaryBlack))
    addNavBarImage()
  }
  // MARK: - ViewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNeedsStatusBarAppearanceUpdate()
  }
  
  private func setupCollectionTagNode() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collectionTagNode = ASCollectionNode(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 52.0),
                                         collectionViewLayout: layout)
    collectionTagNode?.showsHorizontalScrollIndicator = false
    collectionTagNode?.contentInset = UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
    collectionTagNode?.delegate = self
    collectionTagNode?.dataSource = self
    if let tagNode = collectionTagNode {
      self.view.addSubnode(tagNode)
    }
  }
  
  private func setupCollectionContentNode() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 1
    layout.minimumLineSpacing = 1
    collectionContentNode = ASCollectionNode(frame: CGRect(x: 0, y: collectionTagNode?.bounds.height ?? 0,
                                                           width: UIScreen.main.bounds.width,
                                                           height: UIScreen.main.bounds.height - 64 - (self.navigationController?.navigationBar.frame.height ?? 0.0)),
                                             collectionViewLayout: layout)
    collectionContentNode?.showsVerticalScrollIndicator = false
    collectionContentNode?.contentInset = UIEdgeInsets(top: 16, left: 8.0, bottom: 16, right: 8.0)
    collectionContentNode?.delegate = self
    collectionContentNode?.dataSource = self
    collectionContentNode?.leadingScreensForBatching = 2.0
    if let contentNode = collectionContentNode {
      self.view.addSubnode(contentNode)
    }
  }
}

extension MainView: MainPresenterToView {
  func refreshContentTags(items: [String]) {
    
  }
  
  func refreshContentNode(items: [HeroStats]) {
    self.heroStats = items
    self.collectionContentNode?.reloadData()
  }
  
  func setupCollectionNode() {
    setupCollectionTagNode()
    setupCollectionContentNode()
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

extension MainView: ASCollectionDelegate {
  func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
    if collectionNode == collectionContentNode {
      presenter?.didSelectHero(model: self.heroStats[indexPath.item])
    }
  }
}

extension MainView: ASCollectionDataSource {
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    let cellNodeBlock = { () -> ASCellNode in
      if collectionNode == self.collectionTagNode {
        let name = self.presenter?.getTags()[indexPath.row]
        let cellNode = TagNodeCell(data: name ?? "")
        return cellNode
      } else if collectionNode == self.collectionContentNode {
        let data = self.heroStats[indexPath.row]
        let heroNode = CardNode(model: data)
        return heroNode
      } else {
        return ASCellNode()
      }
    }
    return cellNodeBlock
  }
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    if collectionNode == collectionContentNode {
      return self.presenter?.getItems().count ?? 0
    } else {
      return self.presenter?.getTags().count ?? 0
    }
  }
}
