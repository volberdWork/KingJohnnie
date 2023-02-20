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

       
    }
    
    func configureView(model: ProfileStat){
        
    }
    
    
}
