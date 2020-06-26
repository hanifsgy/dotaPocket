//
//  UINavigationBar.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 26/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import UIKit

extension UINavigationBar {
  
  enum NavigationBarKind {
    case solid(color: UIColor)
    case transparent
  }
  
  func configure(with type: NavigationBarKind) {
    switch type {
    case .solid(let color):
      shadowImage         = UIImage()
      isTranslucent       = false
      tintColor           = .black
      barTintColor        = color
      backgroundColor     = color
    case .transparent:
      setBackgroundImage(UIImage(), for: .default)
      shadowImage         = UIImage()
      isTranslucent       = true
      tintColor           = UIColor.white
      barTintColor        = UIColor.clear
      backgroundColor     = UIColor.clear
    }
  }
}
