//
//  MainPresenter.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation

class MainPresenter: MainViewToPresenter {
    weak var view: MainPresenterToView?
    var interactor: MainPresenterToInteractor?
    var router: MainPresenterToRouter?
  
}

extension MainPresenter: MainInteractorToPresenter {
    
}
