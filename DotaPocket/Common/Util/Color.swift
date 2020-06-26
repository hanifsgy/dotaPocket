//
//  Color.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import UIKit

public class Color: UIColor {
  public static func RGBColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
  }
  public static func RGBColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return RGBColor(red: red, green: green, blue: blue, alpha: 1)
  }
}

extension Color {
  public static var primaryBlack: UIColor {
    return Color.RGBColor(red: 0, green: 0, blue: 0)
  }
  public static var primaryGrey: UIColor {
    return Color.RGBColor(red: 112, green: 112, blue: 112)
  }
  public static var primaryRed: UIColor {
    return Color.RGBColor(red: 212, green: 59, blue: 59)
  }
  public static var placeholderColor: UIColor {
    return UIColor.gray.withAlphaComponent(0.8)
  }
}
