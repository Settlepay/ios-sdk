//
//  Service.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 28.04.2021.
//

import Foundation
import Marshal

struct Service {
    
    let id: Int
    let groupID: Int
    let name: String
    let slug: String
    let status: Int
    let minAmount: Int
    let maxAmount: Int
    let fields: [ServiceField]
    
}

//MARK: - Unmarshaling
extension Service: Unmarshaling {
    
    init(object: MarshaledObject) throws {
        self.id = try object.any(for: APIParameterName.id.rawValue) as! Int
        self.groupID = try object.any(for: APIParameterName.groupID.rawValue) as! Int
        self.name = try object.any(for: APIParameterName.name.rawValue) as! String
        self.slug = try object.any(for: APIParameterName.slug.rawValue) as! String
        self.status = try object.any(for: APIParameterName.status.rawValue) as! Int
        self.minAmount = try object.any(for: APIParameterName.minAmount.rawValue) as! Int
        self.maxAmount = try object.any(for: APIParameterName.maxAmount.rawValue) as! Int
        self.fields = SerializerUtils.getArrayOf(type: ServiceField.self, from: object, by: APIParameterName.fields.rawValue) ?? []
    }
    
}
