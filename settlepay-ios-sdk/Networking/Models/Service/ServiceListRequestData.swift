//
//  ServiceListRequestData.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 28.04.2021.
//

import Foundation
import Marshal

struct ServiceListRequestData {
    
    let auth: AuthRequestData
    
}

//MARK: - JSONMarshaling
extension ServiceListRequestData: JSONMarshaling {
    
    func jsonObject() -> JSONObject {
        return [
            APIParameterName.auth.rawValue : self.auth.jsonObject()
        ]
    }
    
}
