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
  private var similiarHero: [HeroStats] = []
  
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
    switch PrimaryAttribute(rawValue: model.primaryAttr ?? "") {
    case .agi: self.similiarHero = getAgiBestMovementSpeed()
    case .str: self.similiarHero = getStrBestAttackMax()
    case .int: self.similiarHero = getIntBestBaseMana()
    default:
      break
    }
    router?.routeToDetail(model: model, similiar: self.similiarHero, view: view)
  }
  
  private func getAgiBestMovementSpeed() -> [HeroStats] {
    let agiHeros = self.items.filter { $0.primaryAttr == PrimaryAttribute.agi.rawValue }
    let result = agiHeros.sorted(by: ({ $0.moveSpeed > $1.moveSpeed }))
    return result
  }
  
  private func getStrBestAttackMax() -> [HeroStats] {
    let strHeroes = self.items.filter { $0.primaryAttr == PrimaryAttribute.str.rawValue }
    let result = strHeroes.sorted(by: ({ $0.baseAttackMax > $1.baseAttackMax }))
    return result
  }
  
  private func getIntBestBaseMana() -> [HeroStats] {
    let intHeroes = self.items.filter { $0.primaryAttr == PrimaryAttribute.int.rawValue }
    let result = intHeroes.sorted(by: ({ $0.baseMana > $1.baseMana }))
    return result
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
