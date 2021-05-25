//
//  SettlePayCompaniesTableViewCell.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 14.04.2021.
//

import UIKit

class SettlePayCompaniesTableViewCell: UITableViewCell {
    
    //MARK: - Defaults
    
    //MARK: - Properties
    
    @IBOutlet weak private var ivMastercard: UIImageView!
    @IBOutlet weak private var ivVisa: UIImageView!
    @IBOutlet weak private var ivPci: UIImageView!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

//MARK: - AutoIndentifierCell
extension SettlePayCompaniesTableViewCell: AutoIndentifierCell { }
