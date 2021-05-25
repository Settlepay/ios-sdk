//
//  SettlePayViewController+CellsDelegates.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 14.04.2021.
//

import UIKit

//MARK: - SettlePayActionButtonTableViewCellDelegate
extension SettlePayViewController: SettlePayActionButtonTableViewCellDelegate {
    
    func didTouchButton(with indexPath: IndexPath) {
        guard let action = SettlePayUIViewModel.ActionButtons(rawValue: indexPath.row) else {
            return
        }
        switch action {
        case .pay:
            self.pay()
        case .save:
            self.saveCard()
        }
    }
    
}

//MARK: - BorderedTextFieldViewDelegate
extension SettlePayViewController: BorderedTextFieldViewDelegate {
    
    func didTouchButton(with name: String?) {
        guard let name = name else {
            return
        }
        guard let buttonType = SDKButton.from(string: name) else {
            return
        }
        if buttonType == .camera {
            self.pushScannerScreen()
        }
    }
    
    func didEnter(text: String?, type: InputType) {
        guard let text = text else {
            return
        }
        switch type {
        case .name:
            self.uiViewModel.set(name: text)
        case .numbers:
            let filtered = text.replacingOccurrences(of: " ", with: "")
            self.uiViewModel.set(number: filtered)
        case .cvv:
            self.uiViewModel.set(cvv: text)
        case .month:
            self.uiViewModel.set(expirationMonth: text)
        case .year:
            self.uiViewModel.set(expirationYear: text)
        }
    }
    
}
