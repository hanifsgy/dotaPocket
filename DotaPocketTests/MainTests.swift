//
//  MainTests.swift
//  DotaPocketTests
//
//  Created by M Hanif Sugiyanto on 29/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Quick
import Nimble
@testable import DotaPocket

class MainTestViewMock: MainPresenterToView {
  var presenter: MainViewToPresenter?
  var isShowLoading: Bool = false
  var isDismissLoading: Bool = false
  var isGetContentNode: Bool = false
  var isGetContentTag: Bool = false
  
  func showLoading() {
    isShowLoading = true
  }
  
  func dismissLoading() {
    isDismissLoading = true
  }
  
  func refreshContentNode(items: [HeroStats]) {
    isGetContentNode = true
  }
  
  func refreshContentTags(items: [String]) {
    isGetContentTag = true
  }
}

class MainTestInteractorMock: MainPresenterToInteractor {
  var presenter: MainInteractorToPresenter?
  var isGetHeroStats: Bool = false
  
  func getHeroStats() {
    isGetHeroStats = true
  }
}

class MainTestRouterMock: MainPresenterToRouter {
  var isRouteToDetail: Bool = false
  
  static func createMainModule() -> UIViewController {
    return UIViewController()
  }
  
  func routeToDetail(model: HeroStats, similiar: [HeroStats], view: MainPresenterToView?) {
    isRouteToDetail = true
  }
}

class MainTest: QuickSpec {
  override func spec() {
    describe("MainTestPresenter") {
      
      var sut: MainPresenter!
      var interactor: MainTestInteractorMock!
      var view: MainTestViewMock!
      var router: MainTestRouterMock!
      
      beforeEach {
        interactor = MainTestInteractorMock()
        view = MainTestViewMock()
        router = MainTestRouterMock()
        sut = MainPresenter()
        sut.interactor = interactor
        sut.view = view
        sut.router = router
      }
      
      context("fetch data called") {
        it("should fetching data") {
          sut.fetchData()
          expect(interactor.isGetHeroStats).to(beTrue())
        }
      }
      context("did select hero called") {
        it("should get hero") {
          sut.didSelectHero(model: HeroStats.dummy)
          expect(router.isRouteToDetail).to(beTrue())
        }
      }
      context("did select tags") {
        it("should get tags") {
          sut.didSelectTags("All")
          expect(view.isGetContentNode).to(beTrue())
        }
      }
      context("did select tags Carry") {
        it("should display carry heroes") {
          sut.didSelectTags("Carry")
          expect(view.isGetContentNode).to(beTrue())
        }
      }
      context("did get heroes stats") {
        it("should refresh content node") {
          sut.getHeroStats(response: HeroStats.dummyContent())
          expect(view.isGetContentNode).to(beTrue())
        }
      }
      context("did get heroes stats") {
        it("should refresh content tag") {
          sut.getHeroStats(response: HeroStats.dummyContent())
          expect(view.isGetContentTag).to(beTrue())
        }
      }
    }
  }
}
