import UIKit

class LossViewController: UIViewController {
    
    @IBOutlet var beckgraundImage: UIImageView!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var incorrectAnswersLabel: UILabel!
    @IBOutlet var statusImage: UIImageView!
    
    @IBOutlet var correctAnswersLabel: UILabel!
    
    var gameStatistic:[WinModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(model: gameStatistic[0])
    }
    
    
    private func setupView(model: WinModel){
        self.beckgraundImage.image = UIImage(named: Constants.Images.loseScreenImage)
        self.beckgraundImage.contentMode = .scaleAspectFill
        self.statusImage.image = UIImage(named: Constants.Images.losseImage)
        statusImage.contentMode = .redraw
        self.timeLabel.text = model.time ?? "0:00"
        self.correctAnswersLabel.text = "\(model.correctAnswer ?? 0)"
        self.incorrectAnswersLabel.text = "\(model.incorrectAnswers ?? 0)"
       

    }
    
    

    @IBAction func homeButtonPressed(_ sender: UIButton) {
        print("Home")
        let main = UIStoryboard(name: "Main", bundle: nil)
                        if let vc = main.instantiateViewController(withIdentifier: "SelectGameViewController") as? SelectGameViewController  {
                            self.navigationController?.pushViewController(vc, animated: true)
                          
                        }
    }
    
    @IBAction func replayAgainButtonPressed(_ sender: UIButton) {
        print("Replay")
        let main = UIStoryboard(name: "Main", bundle: nil)
                        if let vc = main.instantiateViewController(withIdentifier: "ActiveGameViewController") as? ActiveGameViewController  {
                            self.navigationController?.pushViewController(vc, animated: true)
                          
                        }
    }
}
