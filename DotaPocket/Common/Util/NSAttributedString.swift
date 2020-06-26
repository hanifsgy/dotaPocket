//
//  NSAttributedString.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import UIKit

extension NSAttributedString {
  
  static func regular(_ text: String, size: CGFloat, color: UIColor) -> NSAttributedString {
    let attribs: [NSAttributedString.Key: Any] = [
      NSAttributedString.Key.foregroundColor: color,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .regular)
    ]
    return NSAttributedString(string: text, attributes: attribs)
  }
  static func semiBold(_ text: String, size: CGFloat, color: UIColor) -> NSAttributedString {
    let attribs: [NSAttributedString.Key: Any] = [
      NSAttributedString.Key.foregroundColor: color,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .semibold)
    ]
    return NSAttributedString(string: text, attributes: attribs)
  }
  static func bold(_ text: String, size: CGFloat, color: UIColor) -> NSAttributedString {
    let attribs: [NSAttributedString.Key: Any] = [
      NSAttributedString.Key.foregroundColor: color,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .bold)
    ]
    return NSAttributedString(string: text, attributes: attribs)
  }
}
