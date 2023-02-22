import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var centralView: UIView!
    @IBOutlet var lockImage: UIImageView!
    @IBOutlet var levelLable: UILabel!
    
    static func nib()-> UINib{
        return UINib(nibName: "LevelCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureView(){
        centralView.layer.cornerRadius = 5
        centralView.layer.borderWidth = 0.5
        centralView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
    
    public func clearCongigureView(){
        centralView.layer.borderColor = .none
    }
    
}

struct LevelCellConfig{
    var imageName: String
    var levelText: String
}
