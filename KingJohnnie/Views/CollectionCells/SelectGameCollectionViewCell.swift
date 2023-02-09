import UIKit

class SelectGameCollectionViewCell: UICollectionViewCell {
 
    
    
    @IBOutlet var gameNameLabel: UILabel!
    
    @IBOutlet var owerViewLabel: UILabel!
    
    @IBOutlet var levelLabel: UILabel!
    
    
     func configure(model: SelectGameCellModel){
        
        gameNameLabel.text = model.gameName
        gameNameLabel.font = UIFont(name: Constants.FontsStrings.PhosphatePro, size: 45)
        owerViewLabel.text = model.owerview
        levelLabel.text = "Difficulty:"
         owerViewLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 15)
         owerViewLabel.textColor = Constants.Colors.whiteColor
        
        
      
    }
    
}


struct SelectGameCellModel{
    var gameName: String
    var owerview: String
    var levelStars: Int?
}
