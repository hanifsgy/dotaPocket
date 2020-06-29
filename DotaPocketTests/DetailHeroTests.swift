//
//  DetailHeroTests.swift
//  DotaPocketTests
//
//  Created by M Hanif Sugiyanto on 29/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Quick
import Nimble
@testable import DotaPocket

class DetailHeroViewMock: DetailHeroPresenterToView {
  var presenter: DetailHeroViewToPresenter?
  var isGetDetailHero: Bool = false
  
  func setupView(model: HeroStats, similiarHeroes: [HeroStats]) {
    isGetDetailHero = true
  }
}


class DetailHeroTests: QuickSpec {
  override func spec() {
    describe("DetailHeroPresenter Tests") {
      
      var sut: DetailHeroPresenter!
      var view: DetailHeroViewMock!
      
      beforeEach {
        sut = DetailHeroPresenter(model: HeroStats.dummy, similiar: HeroStats.dummyContent())
        view = DetailHeroViewMock()
        sut.view = view
      }
      
      context("view didLoad called") {
        it("should show correct heroes") {
          sut.viewDidLoad()
          expect(view.isGetDetailHero).to(beTrue())
        }
      }
    }
  }
}
