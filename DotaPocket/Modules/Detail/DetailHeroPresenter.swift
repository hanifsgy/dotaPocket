//
//  DetailHeroPresenter.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation

class DetailHeroPresenter: DetailHeroViewToPresenter {
  weak var view: DetailHeroPresenterToView?
  var interactor: DetailHeroPresenterToInteractor?
  var router: DetailHeroPresenterToRouter?
  
  func viewDidLoad() {
    view?.setupView()
  }
}

extension DetailHeroPresenter: DetailHeroInteractorToPresenter {
  
}
