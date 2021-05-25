//
//  NSObject+ClassName.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 11.04.2021.
//

import UIKit

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}
