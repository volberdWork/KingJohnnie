//
//  ActiveGameCollectionViewCell.swift
//  KingJohnnie
//
//  Created by newAccount on 13.02.2023.
//

import UIKit

class ActiveGameCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    
    static func nib()-> UINib{
        return UINib(nibName: "ActiveGameCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
