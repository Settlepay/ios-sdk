//
//  CardTransferService.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 12.05.2021.
//

import Foundation
import Marshal
import Promise

class CardTransferService: BaseService, TransactionUsecase {
    
    //MARK: - Defaults
    
    //MARK: - Properties
    
    let transactionNetworkComponent: TransactionNetworkHandlerComponent
    
    var payURLCallback: ((_ payURL: URL, _ transactionID: Int, _ externalTransactionID: String?) ->())?
    
    var createTransactionCallBack: ((_ response: CreateTransactionResponseData) -> ())?
        
    //MARK: - Initialization
    
    init(with component: TransactionNetworkHandlerComponent) {
        self.transactionNetworkComponent = component
    }
    
    //MARK: - Lifecycle
    
    func p2pTransfer(locale: String, externalTransactionID: String, externalOrderID: String?, externalCustomerID: String?, amount: Int, amountCurrency: String, serviceID: Int, description: String?, recipientCardNumber: String, point: PayPoint, extra: JSONObject?) {
        guard let ip = IPAdressHelper.shared.getWiFiAddress(),
              let accountID = Core.shared.authManager.getAccountID(),
              let walletID = Core.shared.authManager.getWalletID()
              else {
            return
        }
        let fields: [String : Any] = [
            APIParameterName.recipientCardNumber.rawValue   : recipientCardNumber
        ]
        self.createTransaction(locale: locale, externalTransactionID: externalTransactionID, externalOrderID: externalOrderID, externalCustomerID: externalCustomerID, customerIPAdress: ip, amount: amount, amountCurrency: amountCurrency, serviceID: serviceID, accountID: accountID, walletID: walletID, description: description, fields: fields, point: point, extra: extra) { [weak self] (response) in
            if let payURLPath = response.result?.optionalAny(for: APIParameterName.payUrl.rawValue) as? String {
                let payURL = URL(string: payURLPath)
                self?.proceedWith(payURL: payURL, transactionID: response.id, externalTransactionID: externalTransactionID, callback: self?.payURLCallback)
            }
            self?.createTransactionCallBack?(response)
        }
    }
        
    
}
