// 
//  MainProtocols.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import UIKit

protocol MainPresenterToView: class {
  var presenter: MainViewToPresenter? { get set }
  func setupCollectionNode()
  func showLoading()
  func dismissLoading()
  func refreshContentNode(items: [HeroStats])
  func refreshContentTags(items: [String])
}

protocol MainPresenterToInteractor: class {
  var presenter: MainInteractorToPresenter? { get set }
  
  func getHeroStats()
}

protocol MainPresenterToRouter: class {
  static func createMainModule() -> UIViewController
  
}

protocol MainViewToPresenter: class {
  var view: MainPresenterToView? { get set }
  var interactor: MainPresenterToInteractor? { get set }
  var router: MainPresenterToRouter? { get set }
  
  func viewDidLoad()
  func fetchData()
  func getItems() -> [HeroStats]
  func getTags() -> [String]
}

protocol MainInteractorToPresenter: class {
  func getHeroStats(response: [HeroStats])
  func failed()
}
