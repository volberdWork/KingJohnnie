import UIKit

class SelectGameCollectionViewCell: UICollectionViewCell {
 
    
    @IBOutlet var imagesStars: [UIImageView]!
    
    @IBOutlet var gameNameLabel: UILabel!
    
    @IBOutlet var owerViewLabel: UILabel!
    
    @IBOutlet var levelLabel: UILabel!
    
    let imageStar = UIImage(named: Constants.Images.starOrangeLevelIcon)

     func configure(model: SelectGameCellModel){
        
        gameNameLabel.text = model.gameName
        gameNameLabel.font = UIFont(name: Constants.FontsStrings.PhosphatePro, size: 40)
         owerViewLabel.text = model.shortOverview
        levelLabel.text = "Difficulty:"
         levelLabel.font = UIFont(name: Constants.FontsStrings.InterBold , size: 15)
         owerViewLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 15)
         owerViewLabel.textColor = Constants.Colors.whiteColor
         for i in imagesStars{
             i.image = UIImage(named: Constants.Images.starGrayLevelIcon)
         }
         for i in 0..<model.levelStars{
             imagesStars[i].image = imageStar
         }
         
         }
      
        
        
      
    }
    



struct SelectGameCellModel{
    var gameName: String
    var shortOverview: String
    var levelStars: Int
    var longOverView: String
}
