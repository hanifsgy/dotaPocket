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
  private var similiar: [HeroStats] = []
  
  init(model: HeroStats, similiar: [HeroStats]) {
    self.model = model
    self.similiar = similiar
  }
  
  func viewDidLoad() {
    let bestThreeHeroes = Array(similiar.prefix(3))
    view?.setupView(model: model, similiarHeroes: bestThreeHeroes)
  }
}

extension DetailHeroPresenter: DetailHeroInteractorToPresenter {
  
}
