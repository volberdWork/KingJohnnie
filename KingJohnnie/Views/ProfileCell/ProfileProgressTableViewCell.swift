import UIKit
import ALProgressView

class ProfileProgressTableViewCell: UITableViewCell {

    @IBOutlet var procentProgressView: ALProgressBar!
    @IBOutlet var lossProgressView: ALProgressBar!
    @IBOutlet var winProgressView: ALProgressBar!
    @IBOutlet var levelGameLabel: UILabel!
    @IBOutlet var gameNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        levelGameLabel.text = "Level 12"
        levelGameLabel.textColor = .white
        levelGameLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 15)
        
        gameNameLabel.text = "KING OF LIGHT"
        gameNameLabel.textColor = .white
        gameNameLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 20
        )
    }
    
    func configureView(model: ProfileStat){
        
    }
    
    
}
