// 
//  DetailHeroProtocols.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import UIKit


//MARK: View -
protocol DetailHeroPresenterToView: class {
    var presenter: DetailHeroViewToPresenter? { get set }
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
}

//MARK: Interactor -
protocol DetailHeroPresenterToInteractor: class {
    var presenter: DetailHeroInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
}


//MARK: Router -
protocol DetailHeroPresenterToRouter: class {
    static func createDetailHeroModule() -> UIViewController
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol DetailHeroViewToPresenter: class {
    var view: DetailHeroPresenterToView? {get set}
    var interactor: DetailHeroPresenterToInteractor? {get set}
    var router: DetailHeroPresenterToRouter? {get set}
    
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
}

protocol DetailHeroInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}
