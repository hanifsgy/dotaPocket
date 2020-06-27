//
//  MainWorker.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol MainWorkerProtocol: class {
  func didSuccessGetHeroStats(response: [HeroStats])
  func didFailedGetHeroStats()
}

public class MainWorker {
  public static var instance = MainWorker()
  private let disposeBag: DisposeBag = DisposeBag()
  private let service: NetworkService = NetworkService.instance
  
  public weak var mainDelegate: MainWorkerProtocol?
  
  func fetchHeroStats() {
    service.request(DotaPocketAPI.heroStats, c: HeroStatsResponse.self)
      .subscribe(onSuccess: { [weak self] (response) in
        debugPrint(response)
        self?.mainDelegate?.didSuccessGetHeroStats(response: response)
        }, onError: { [weak self] (error) in
          self?.mainDelegate?.didFailedGetHeroStats()
      })
    .disposed(by: disposeBag)
  }
}
