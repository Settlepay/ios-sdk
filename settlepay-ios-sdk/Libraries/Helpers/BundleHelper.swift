//
//  BundleHelper.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 14.05.2021.
//

import Foundation
import UIKit

class BundleHelper: NSObject {
    
    static var bundle: Bundle {
        let myBundle = Bundle(for: Self.self)
        guard let resourceBundleURL = myBundle.url(
            forResource: "settlepay-ios-sdk", withExtension: "bundle")
            else {
            fatalError("settlepay-ios-sdk.bundle not found!")
        }
        guard let resourceBundle = Bundle(url: resourceBundleURL)
            else {
            fatalError("Cannot access settlepay-ios-sdk.bundle!")
        }
        return resourceBundle
    }
    
}
