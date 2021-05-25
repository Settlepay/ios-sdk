//
//  SettlePayViewController+UITableView.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 11.04.2021.
//

import UIKit

//MARK: - UITableViewDelegate
extension SettlePayViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension SettlePayViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        self.uiViewModel.getSectionsCount()
    }
    
    //MARK: - Cells
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.uiViewModel.getSectionType(from: section) else {
            return 0
        }
        return section.cellsCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = self.uiViewModel.getSectionType(from: indexPath.section) else {
            return UITableViewCell()
        }
        guard let cellType = self.uiViewModel.getCellType(from: indexPath.row, section: section) else {
            return UITableViewCell()
        }
        switch cellType {
        case SettlePayUIViewModel.PaymentGeneralCells.logo:
            let cell = tableView.getReusableCell(type: SettlePayLogoTableViewCell.self, for: indexPath)!
            cell.logo = PaymentSDK.shared.logo
            return cell
        case SettlePayUIViewModel.PaymentGeneralCells.title:
            let title = self.uiViewModel.getTransactionNumberTitle()
            let cell = tableView.getReusableCell(type: SettlePayGeneralTitleTableViewCell.self, for: indexPath)!
            cell.title = title
            return cell
        case SettlePayUIViewModel.PaymentGeneralCells.sum:
            let sum = self.uiViewModel.getTransactionAmount()
            let cell = tableView.getReusableCell(type: SettlePayGeneralSumTableViewCell.self, for: indexPath)!
            cell.sum = sum
            return cell
        case SettlePayUIViewModel.CardInfoCells.cardName:
            let cell = tableView.getReusableCell(type: SettlePayCardNameTableViewCell.self, for: indexPath)!
            cell.delegate = self
            return cell
        case SettlePayUIViewModel.CardInfoCells.cardNumber:
            let number = self.uiViewModel.getCardNumber()
            let cell = tableView.getReusableCell(type: SettlePayCardNumberTableViewCell.self, for: indexPath)!
            cell.cardNumber = number
            cell.delegate = self
            return cell
        case SettlePayUIViewModel.CardInfoCells.cardDates:
            let month = self.uiViewModel.getCardExpirationMonth()
            let year = self.uiViewModel.getCardExpirationYear()
            let cell = tableView.getReusableCell(type: SettlePayCardDatesTableViewCell.self, for: indexPath)!
            cell.delegate = self
            cell.month = month
            cell.year = year
            return cell
        case SettlePayUIViewModel.CardInfoCells.cardCVV:
            let cell = tableView.getReusableCell(type: SettlePayCardCVVTableViewCell.self, for: indexPath)!
            cell.delegate = self
            return cell
        case SettlePayUIViewModel.ActionButtons.pay:
            let cell = tableView.getReusableCell(type: SettlePayActionButtonTableViewCell.self, for: indexPath)!
            cell.title = SettlePayUIViewModel.ActionButtons.pay.name
            cell.delegate = self
            cell.isFilled = true
            cell.indexPath = indexPath
            return cell
        case SettlePayUIViewModel.ActionButtons.save:
            let cell = tableView.getReusableCell(type: SettlePayActionButtonTableViewCell.self, for: indexPath)!
            cell.title = SettlePayUIViewModel.ActionButtons.save.name
            cell.delegate = self
            cell.isFilled = false
            cell.indexPath = indexPath
            return cell
        case SettlePayUIViewModel.PaymentCompanies.logos:
            let cell = tableView.getReusableCell(type: SettlePayCompaniesTableViewCell.self, for: indexPath)!
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    //MARK: - Header
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    //MARK: - Footer
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
}
