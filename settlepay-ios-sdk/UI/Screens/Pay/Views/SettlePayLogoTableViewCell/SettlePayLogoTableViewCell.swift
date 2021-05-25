//
//  SettlePayLogoTableViewCell.swift
//  settlepay-ios-sdk
//
//  Created by Yelyzaveta Kartseva on 25.05.2021.
//

import UIKit

class SettlePayLogoTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak private var ivLogo: UIImageView!
    
    
    var logo: UIImage? {
        didSet {
            self.ivLogo.image = self.logo
        }
    }
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

//MARK: - AutoIndentifierCell
extension SettlePayLogoTableViewCell: AutoIndentifierCell {}
