// 
//  DetailHeroProtocols.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

protocol DetailHeroPresenterToView: class {
  var presenter: DetailHeroViewToPresenter? { get set }
  
  func setupView()
}

protocol DetailHeroPresenterToInteractor: class {
  var presenter: DetailHeroInteractorToPresenter?  { get set }

}

protocol DetailHeroPresenterToRouter: class {
  static func createDetailHeroModule(node: ASDisplayNode, data: DetailHeroModel) -> UIViewController
  
}

protocol DetailHeroViewToPresenter: class {
  var view: DetailHeroPresenterToView? {get set}
  var interactor: DetailHeroPresenterToInteractor? {get set}
  var router: DetailHeroPresenterToRouter? {get set}
  
  func viewDidLoad()
}

protocol DetailHeroInteractorToPresenter: class {
  
}
