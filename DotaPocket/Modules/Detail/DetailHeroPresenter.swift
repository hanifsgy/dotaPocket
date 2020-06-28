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
  private var model: HeroStats!
  
  init(model: HeroStats) {
    self.model = model
    debugPrint("Detail hero: \(model)")
  }
  
  func viewDidLoad() {
    view?.setupView(model: model)
  }
}

extension DetailHeroPresenter: DetailHeroInteractorToPresenter {
  
}
