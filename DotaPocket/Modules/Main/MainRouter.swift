// 
//  MainRouter.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class MainRouter: MainPresenterToRouter {
  
  static func createMainModule() -> UIViewController {
    let view: ASViewController & MainPresenterToView = MainView()
    let presenter: MainViewToPresenter & MainInteractorToPresenter = MainPresenter()
    let interactor: MainPresenterToInteractor = MainInteractor(worker: MainWorker.instance)
    let router: MainPresenterToRouter = MainRouter()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
  
  func routeToDetail(model: HeroStats, similiar: [HeroStats], view: MainPresenterToView?) {
    if let view = view as? UIViewController {
      let detailHero = DetailHeroRouter.createDetailHeroModule(data: model, similiar: similiar)
      view.navigationController?.pushViewController(detailHero, animated: true)
    }
  }
}
