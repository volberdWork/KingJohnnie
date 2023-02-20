import UIKit
import ALProgressView

class ProfileProgressTableViewCell: UITableViewCell {

    @IBOutlet var procentProgressView: ALProgressRing!
    @IBOutlet var lossProgressView: ALProgressRing!
    @IBOutlet var winProgressView: ALProgressRing!
    @IBOutlet var levelGameLabel: UILabel!
    @IBOutlet var gameNameLabel: UILabel!
    
    @IBOutlet var winProcentLabel: UILabel!
    @IBOutlet var lossLabel: UILabel!
    @IBOutlet var winLabel: UILabel!
    var winCount = UserDefaults.standard.integer(forKey: "winCount")
    var lossCount = UserDefaults.standard.integer(forKey: "lossCount")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        winLabel.text = "Win   \(winCount)"
        lossLabel.text = "Loss  \(lossCount)"
        winProcentLabel.text = "Win% \(winCount/(winCount+lossCount)*100)"
        levelGameLabel.text = "Level 12"
        levelGameLabel.textColor = .white
        levelGameLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 15)
        
        winProgressView.lineWidth = 10
        winProgressView.startColor = Constants.Colors.orangeColor
        winProgressView.endColor = Constants.Colors.orangeColor
        winProgressView.setProgress(Float((winCount/(winCount+lossCount))), animated: true)
        
        lossProgressView.lineWidth = 10
        lossProgressView.startColor = Constants.Colors.orangeColor
        lossProgressView.endColor = Constants.Colors.orangeColor
        lossProgressView.setProgress(Float((lossCount/(winCount+lossCount))), animated: true)
        
        procentProgressView.lineWidth = 10
        procentProgressView.startColor = Constants.Colors.orangeColor
        procentProgressView.endColor = Constants.Colors.orangeColor
        procentProgressView.setProgress(Float((winCount/(winCount+lossCount))), animated: true)
        
        gameNameLabel.text = "KING OF LIGHT"
        gameNameLabel.textColor = .white
        gameNameLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 20)
    }
    
    func configureView(model: ProfileStat){
       
    }
    
    
}
