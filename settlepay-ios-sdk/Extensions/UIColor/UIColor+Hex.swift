//
//  UIColor+Hex.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 10.04.2021.
//

import UIKit

extension UIColor {
    
    convenience init(hex:String) {
        
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

            if hexFormatted.hasPrefix("#") {
                hexFormatted = String(hexFormatted.dropFirst())
            }

            assert(hexFormatted.count == 6, "Invalid hex code used.")

            var rgbValue: UInt64 = 0
            Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
    }
    
}
