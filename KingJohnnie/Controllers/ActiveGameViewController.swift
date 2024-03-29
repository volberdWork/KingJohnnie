import UIKit
import ALProgressView

class ActiveGameViewController: UIViewController {
    
    @IBOutlet var systemBlur: UIVisualEffectView!
    
    @IBOutlet var blurePointsLabel: UILabel!
    @IBOutlet var blureView: UIView!
    @IBOutlet var leftPointsLabel: UILabel!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var progressRing: ALProgressRing!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet var pauseLabel: UILabel!
    @IBOutlet var blureProgressRing: ALProgressRing!
    @IBOutlet var blureTimeLabel: UILabel!
    
    let coorrectAnswersArray = [
        "Great job! You really know your stuff!",
        "Excellent work! Keep it up!",
        "That's correct! You're doing great!",
        "You're a natural at this!",
        "Fantastic! You're on fire",
        "Well done! You're making it look easy",
        "Bravo! You're a real expert",
        "Amazing! You're a trivia whiz",
        "Spot on! You're nailing these answers",
        "Perfect! You're knocking these questions out of the park"]
    
    let incorrectAnswersArrat = [
        "Don't worry, you'll get the next one",
        "That was a tough question, don't give up",
        "It's okay, you're still doing great",
        "Not quite, but you're close",
        "You're on the right track, keep trying",
        "Almost there, don't lose hope",
        "Keep going, you'll get it eventually",
        "Nice try, you'll do better on the next one"]
    
    
    let globalItemsCount = ["99", "4", "6",
                            "1", "8", "7",
                            "21", "55", "33"]
    
    var time = (UserProgressData.gameLevel * 5) + 45
    var timer:Timer = Timer()
    var moveRange = Int()
    var currentMove = 0
    var wrongAnswers = 0
    var currenTime = ""
    var randoms = [Int]()
    var answerBuffer = [Int]()
    var progressGoal = 0
    var progressTarget = (UserProgressData.gameLevel * 3) + 10
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        blureView.isHidden = true
        print("Level \(UserProgressData.gameLevel)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Кулькість програшів: \(getLossCount())")
        print("Кулькість виграшів: \(getWinCount())")
        
        setupView()
        leftPointsLabel.text = "Let's do it!"
        progressRing.setProgress(0.0, animated: true)
        pointsLabel.text = "\(progressGoal) / \(progressTarget)"
        timerLabel.text = ""
        timerLabel.textColor = UIColor(red: 36/255, green: 30/255, blue: 23/255, alpha: 1)
        timerLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 20)
        
        timerLabel.layer.masksToBounds = false
        timerLabel.layer.shadowColor = UIColor.red.cgColor
        timerLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        timerLabel.layer.shadowOpacity = 1.0
        timerLabel.layer.shadowRadius = 3.0
        
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor(red: 241/255, green: 195/255, blue: 153/255, alpha: 1),
            NSAttributedString.Key.strokeWidth : -3.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26)
        ]
        as [NSAttributedString.Key : Any]
        
        timerLabel.attributedText = NSAttributedString(string: "00:00", attributes: strokeTextAttributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            timerStart()
            progressRing.lineWidth = 10
            progressRing.tintColor = .yellow
            progressRing.startColor = Constants.Colors.orangeColor
            progressRing.grooveColor = .brown
            progressRing.tintColor = .white
            progressRing.endColor = Constants.Colors.orangeColor
        }
    }
    
    
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.activeGameScreen)
    }
    
    private func timerStart(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let minutes = self.time / 60 % 60
            let seconds = self.time % 60
            self.time -= 1
            self.timerLabel.text = String(format:"%02i:%02i", minutes, seconds)
            self.currenTime = String(format:"%02i:%02i", minutes, seconds)
            if self.time == 0 {
                timer.invalidate()
                let main = UIStoryboard(name: "Main", bundle: nil)
                if let vc = main.instantiateViewController(withIdentifier: "LossViewController") as? LossViewController  {
                    self.navigationController?.pushViewController(vc, animated: true)
                    vc.gameStatistic = [WinModel(time: "00:00", correctAnswer: self.progressGoal, incorrectAnswers: self.wrongAnswers)]
                }
                self.incrementLossCount()
                
            }
            
        }
        
        self.collectionView.isUserInteractionEnabled = false
        self.animateCombination()
    }
    func incrementLossCount() {
        let defaults = UserDefaults.standard
        let lossCount = defaults.integer(forKey: "lossCount")
        defaults.set(lossCount + 1, forKey: "lossCount")
    }
    
    func getLossCount() -> Int {
        let defaults = UserDefaults.standard
        let lossCount = defaults.integer(forKey: "lossCount")
        return lossCount
    }
    
    func incrementWinCount() {
        let defaults = UserDefaults.standard
        let lossCount = defaults.integer(forKey: "winCount")
        defaults.set(lossCount + 1, forKey: "winCount")
    }
    
    func getWinCount() -> Int {
        let defaults = UserDefaults.standard
        let lossCount = defaults.integer(forKey: "winCount")
        return lossCount
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
        self.backgroundImage.contentMode = .scaleAspectFill
        self.collectionView.backgroundColor = .clear
    }
    
    
    @objc func dismissPopUp() {
        timerStart()
    }
    
    func congigureBlureView(){
        self.pauseLabel.text = "PAUSE"
        pauseLabel.textColor = .white
        pauseLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 32)
        blureTimeLabel.textColor = .white
        blureTimeLabel.text = "Time left     \(timerLabel.text ?? "00:00")"
        blureProgressRing.setProgress(Float(progressGoal) / Float(progressTarget), animated: true)
        blurePointsLabel.text = pointsLabel.text
        blureProgressRing.lineWidth = 5
        blureProgressRing.startColor = Constants.Colors.orangeColor
        blureProgressRing.endColor = Constants.Colors.orangeColor
    }
    
    @IBAction func pressedPauseButon(_ sender: UIButton) {
        
        timer.invalidate()
        blureView.isHidden = false
        congigureBlureView()
        systemBlur.effect = UIBlurEffect(style: .dark)
        systemBlur.alpha = 0.8
        SonundAndVibration().makeVibration()
        SonundAndVibration().playSound()
        
    }
    
    //MARK: Main Logic
    private func animateCombination() {
        moveRange = Int.random(in: 2...3)
        randoms = Int.getUniqueRandomNumbers(min: 0, max: 8, count: moveRange)
        print("Randoms", randoms)
        var timeDelay = 0.0
        
        for x in randoms {
            
            animationForSelection(index: x, delay: timeDelay)
            timeDelay += 0.3
            
            collectionView.isUserInteractionEnabled = true
        }
        
        
    }
    
    func gameChecker(selectedIndex: Int) {
        
        //
        answerBuffer.append(selectedIndex)
        
        if answerBuffer[currentMove] == randoms[currentMove] {
            currentMove += 1
            print("RIGHT Answer")
            
            
            if currentMove == randoms.count {
                let randomIndex = Int.random(in: 0..<self.coorrectAnswersArray.count)
                UIView.animate(withDuration: 0.7, delay: 0.0, options: [], animations: {
                    self.leftPointsLabel.text = self.coorrectAnswersArray[randomIndex]
                    self.leftPointsLabel.textColor = .systemGreen
                    self.leftPointsLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 16)
                    self.leftPointsLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.7, delay: 0.0, options: [], animations: {
                        self.leftPointsLabel.textColor = .white
                        self.leftPointsLabel.transform = CGAffineTransform.identity
                        self.leftPointsLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 16)
                    }, completion: nil)
                })
                progressGoal += 1
                currentMove = 0
                moveRange = 0
                answerBuffer.removeAll()
                pointsLabel.text = "\(progressGoal) / \(progressTarget)"
                progressRing.setProgress(Float(progressGoal) / Float(progressTarget), animated: true)
                if progressGoal == progressTarget {
                    timer.invalidate()
                    incrementWinCount()
                    UserProgressData.gameLevel += 1
                    let main = UIStoryboard(name: "Main", bundle: nil)
                    if let vc = main.instantiateViewController(withIdentifier: "WinViewController") as? WinViewController  {
                        self.navigationController?.pushViewController(vc, animated: true)
                        vc.gameStatistic = [WinModel(time: self.currenTime, correctAnswer: progressGoal, incorrectAnswers: self.wrongAnswers)]
                    }
                } else {
                    
                    collectionView.isUserInteractionEnabled = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [self] in
                        animateCombination()
                    })
                }
            }
        } else {
            let randomIndex = Int.random(in: 0..<self.incorrectAnswersArrat.count)
            self.leftPointsLabel.text = incorrectAnswersArrat[randomIndex]
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [], animations: {
                self.leftPointsLabel.textColor = .systemRed
                self.leftPointsLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 16)
                self.leftPointsLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: { _ in
                UIView.animate(withDuration: 0.7, delay: 0.0, options: [], animations: {
                    self.leftPointsLabel.textColor = .white
                    self.leftPointsLabel.transform = CGAffineTransform.identity
                    self.leftPointsLabel.font = UIFont(name: Constants.FontsStrings.InterMedium, size: 16)
                }, completion: nil)
            })
            currentMove = 0
            self.wrongAnswers += 1
            collectionView.isUserInteractionEnabled = false
            answerBuffer.removeAll()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [self] in
                animateCombination()
            })
        }
    }
    
    func animationForSelection(index: Int, delay: Double) {
        
        let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! ActiveGameCollectionViewCell
        
        UIView.animate(withDuration: 0.5, delay: delay, animations: {
            cell.transform = .init(scaleX: 0.8, y: 0.8)
            cell.backgroundColor = UIColor(red: 0.654, green: 0.498, blue: 0.365, alpha: 0.4)
            
            cell.indicatorImageView.image = UIImage(named: "lionActive")
        },completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                cell.transform = .identity
                cell.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.45)
                
                cell.indicatorImageView.image = UIImage(named: "lionDeactive")
            })
        })
        
    }
    
    @IBAction func blureCancelButtonPressed(_ sender: UIButton) {
        blureView.isHidden = true
        timerStart()
    }
    @IBAction func blurePlayButtonPressed(_ sender: UIButton) {
        blureView.isHidden = true
        timerStart()
    }
    
    @IBAction func blureHomeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}


extension ActiveGameViewController: UICollectionViewDelegate {
    
}


extension ActiveGameViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return globalItemsCount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveGameCollectionViewCell", for: indexPath) as! ActiveGameCollectionViewCell
        
        cell.indicatorImageView.image = UIImage(named: "lionDeactive")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameChecker(selectedIndex: indexPath.row)
        animationForSelection(index: indexPath.row, delay: 0.0)
        SonundAndVibration().makeVibration()
        SonundAndVibration().playSound()
    }
    
    
    
    
}

extension ActiveGameViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5 - 5, height: collectionView.frame.width / 5 - 5)
    }
    
}


//MARK: Function for gettting random numbers
extension Int {
    
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
    
}
struct ProfileStat{
    var winCount: Int
    var losseCount: Int
    var procentOfWin: Int
    var cauntOgGames: Int
}
