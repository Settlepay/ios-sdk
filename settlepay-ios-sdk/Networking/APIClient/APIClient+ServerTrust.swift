//
//  APIClient+ServerTrust.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 16.04.2021.
//

import Alamofire
import Foundation

extension APIClient {
    
    var serverTrustPolicies: [String : ServerTrustEvaluating] {
        return [
            "api.4bill.io" : DisabledTrustEvaluator(),
        ]
    }
    
}
