//
//  SettingsTableViewCell.swift
//  KingJohnnie
//
//  Created by newAccount on 11.02.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: SettingsTableViewCell.self)
    var toogleHandler: (Bool) -> () = { _ in }
    
    @IBOutlet var centralView: UIView!
    @IBOutlet var settingsNameLabel: UILabel!
    @IBOutlet var iconButtonImage: UIImageView!
    
    @IBOutlet var disclosureIcon: UIImageView!
    @IBOutlet var settingsSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        settingsSwitch.isHidden = true
//        disclosureIcon.isHidden = true
        centralView.backgroundColor = .clear
        self.selectionStyle = .none
        
        
        
    }
    
}
