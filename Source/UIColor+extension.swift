//
//  UIColor+extension.swift
//  APJExtensions
//
//  Created by Angelo Pino on 02/08/2019.
//  Copyright © 2019 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UIColor {
    static func colorFrom(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            return .gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return colorFrom(rgb: rgbValue, alpha: alpha)
    }
    
    static func colorFrom(rgb: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 0xff,
            green = CGFloat((rgb & 0xFF00) >> 8) / 0xff,
            blue = CGFloat(rgb & 0xFF) / 0xff
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
