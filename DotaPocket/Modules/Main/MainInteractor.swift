// 
//  MainInteractor.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation

class MainInteractor: MainPresenterToInteractor {
  weak var presenter: MainInteractorToPresenter?
  private var worker: MainWorker?
  
  init(worker: MainWorker) {
    self.worker = worker
    self.worker?.mainDelegate = self
  }
  
  func getHeroStats() {
    worker?.fetchHeroStats()
  }
}

extension MainInteractor: MainWorkerProtocol {
  func didSuccessGetHeroStats(response: [HeroStats]) {
    presenter?.getHeroStats(response: response)
  }
  
  func didFailedGetHeroStats() {
    presenter?.failed()
  }
}
