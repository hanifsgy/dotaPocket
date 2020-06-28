// 
//  DetailHeroRouter.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class DetailHeroRouter: DetailHeroPresenterToRouter {
  
  static func createDetailHeroModule(data: HeroStats) -> UIViewController {
    let view: ASViewController & DetailHeroPresenterToView = DetailHeroView()
    let presenter: DetailHeroViewToPresenter & DetailHeroInteractorToPresenter = DetailHeroPresenter(model: data)
    let interactor: DetailHeroPresenterToInteractor = DetailHeroInteractor()
    let router: DetailHeroPresenterToRouter = DetailHeroRouter()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
}
