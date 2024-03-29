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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureView(model: ProfileGameStatistic){
        winLabel.text = "Win     \(model.winCounts)"
        lossLabel.text = "Loss  \(model.lossCount)"
        
       
        
        let procentNumber = (Double(model.winCounts)/Double((Float(model.winCounts)+Float(model.lossCount))))*100.0
        let formattedNumber = String(format: "%.1f", procentNumber)
        
        winProcentLabel.text = "Win%"+formattedNumber
        levelGameLabel.text = "Level \(model.currentLevel)"
        levelGameLabel.textColor = .white
        levelGameLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 15)
        if model.winCounts == 0 && model.lossCount == 0{
            winLabel.textColor = .systemOrange
            lossLabel.textColor = .systemOrange
            winProcentLabel.text = "Win%  0"
            winProcentLabel.textColor = .systemOrange
        }
        
        winProgressView.lineWidth = 10
        winProgressView.startColor = Constants.Colors.orangeColor
        winProgressView.endColor = Constants.Colors.orangeColor
        winProgressView.setProgress(Float(model.winCounts)/Float((model.winCounts + model.lossCount)), animated: true)
        winProgressView.grooveColor = Constants.Colors.alphaOrange
        
        lossProgressView.lineWidth = 10
        lossProgressView.startColor = Constants.Colors.orangeColor
        lossProgressView.endColor = Constants.Colors.orangeColor
        lossProgressView.setProgress(Float(model.lossCount)/Float((model.winCounts + model.lossCount)), animated: true)
        lossProgressView.grooveColor = Constants.Colors.alphaOrange
        
        procentProgressView.lineWidth = 10
        procentProgressView.startColor = Constants.Colors.orangeColor
        procentProgressView.endColor = Constants.Colors.orangeColor
        procentProgressView.setProgress(Float(model.winCounts)/Float((model.winCounts + model.lossCount)), animated: true)
        procentProgressView.grooveColor = Constants.Colors.alphaOrange
        
        gameNameLabel.text = model.nameOfGame
        gameNameLabel.textColor = .white
        gameNameLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 20)
    }
}
