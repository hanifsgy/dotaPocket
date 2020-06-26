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
        let interactor: MainPresenterToInteractor = MainInteractor()
        let router: MainPresenterToRouter = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
