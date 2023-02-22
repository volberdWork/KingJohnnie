import UIKit

class WinViewController: UIViewController {
    
    
    
    @IBOutlet var incorrectAnswerLabel: UILabel!
    @IBOutlet var correctAnswersLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var statusImage: UIImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var backgroundImage: UIImageView!
    
    var gameStatistic:[WinModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(model: gameStatistic[0])
        
    }
    
    
    private func setupView(model: WinModel){
        self.backgroundImage.image = UIImage(named: Constants.Images.mainWinScreenImage)
        self.backgroundImage.contentMode = .scaleAspectFill
        self.statusImage.image = UIImage(named: Constants.Images.winImage)
        statusImage.contentMode = .redraw
        self.timeLabel.text = model.time ?? "0:00"
        self.correctAnswersLabel.text = "\(model.correctAnswer ?? 0)"
        self.incorrectAnswerLabel.text = "\(model.incorrectAnswers ?? 0)"
        
        
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "ActiveGameViewController") as? ActiveGameViewController  {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}

struct WinModel{
    var time: String?
    var correctAnswer: Int?
    var incorrectAnswers: Int?
}
