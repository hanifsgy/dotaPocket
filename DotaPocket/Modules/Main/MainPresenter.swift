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
  private var items: [HeroStats] = []
  
  func viewDidLoad() {
  }
  
  func fetchData() {
    interactor?.getHeroStats()
  }
  
  func getItems() -> [HeroStats] {
    return self.items
  }
  
  func getTags() -> [String] {
    var rolesTag: [String] = HeroRoles.item
    rolesTag.insert("All", at: 0)
    return rolesTag
  }
  
  func didSelectHero(model: HeroStats) {
    router?.routeToDetail(model: model, view: view)
  }
}

extension MainPresenter: MainInteractorToPresenter {
  func getHeroStats(response: [HeroStats]) {
    self.items = response
    view?.refreshContentNode(items: response)
    view?.refreshContentTags(items: getTags())
  }
  
  func failed() {
    
  }
}
