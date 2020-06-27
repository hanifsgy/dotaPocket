//
//  DetailHeroView.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 27/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import AsyncDisplayKit

class DetailHeroView: ASViewController<ASDisplayNode> {
    var presenter: DetailHeroViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailHeroView: DetailHeroPresenterToView {
  
}
