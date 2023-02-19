import UIKit
import ALProgressView

class ActiveGameViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var progressRing: ALProgressRing!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    let globalItemsCount = ["99", "4", "6",
                            "1", "8", "7",
                            "21", "55", "33"]
    
    var time = (UserProgressData.gameLevel * 5) + 40
    var timer:Timer = Timer()
    var moveRange = Int()
    var currentMove = 0
    var currenTime = ""
    var randoms = [Int]()
    var answerBuffer = [Int]()
    var progressGoal = 0
    var progressTarget = (UserProgressData.gameLevel * 3) + 10 //for example only
    var customView = UIView()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Кулькість програшів: \(getLossCount())")
        print("Кулькість виграшів: \(getWinCount())")
        setupView()
        progressRing.setProgress(0.0, animated: true)
        
        pointsLabel.text = "\(progressGoal) / \(progressTarget)"
        timerLabel.text = ""
        
        
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
                    vc.gameStatistic = [WinModel(time: "00:00", correctAnswer: self.progressGoal, incorrectAnswers: 4)]
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
    
    @objc func showPopUp() {
        
        self.customView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        self.customView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(customView)
        let popUpView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 200))
        popUpView.backgroundColor = .white
        popUpView.layer.cornerRadius = 10
        //
        //        let imageBackground = UIImage(named: Constants.Images.blureView)
        //        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(popUpView.frame.size.width), height: Int(popUpView.frame.size.height)))
        //        background.image = imageBackground
        //        background.contentMode = .scaleToFill
        //
        //           let label = UILabel(frame: CGRect(x: 0, y: 0, width: popUpView.frame.width, height: 50))
        //           label.text = "PAUSE"
        //        label.textColor = .yellow
        //           label.textAlignment = .center
        //        label.font = UIFont(name: Constants.FontsStrings.InterBold, size: 30)
        //
        //           background.addSubview(label)
        //
        let closeButton = UIButton()
        closeButton.frame = CGRect(x: 16, y: 16, width: 25, height: 25)
        closeButton.setImage(UIImage(named: Constants.Images.icons.backButton), for: .normal)
        closeButton.addTarget(self, action: #selector(dismissPopUp), for: .touchUpInside)
        //
        popUpView.addSubview(closeButton)
        //        background.center = popUpView.center
        //        popUpView.addSubview(background)
        //
        popUpView.center = view.center
        customView.addSubview(popUpView)
    }
    
    @objc func dismissPopUp() {
        for subview in self.customView.subviews {
            if subview.backgroundColor == .white{
                subview.removeFromSuperview()
            }
            
        }
        customView.isHidden = true
        timerStart()
    }
    
    @IBAction func pressedPauseButon(_ sender: UIButton) {
        
        timer.invalidate()
        showPopUp()
        SettingsViewController().playSound()
        SettingsViewController().makeVibration()
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
                
                //
                progressGoal += 1
                
                //
                currentMove = 0
                moveRange = 0
                answerBuffer.removeAll()
                
                //
                pointsLabel.text = "\(progressGoal) / \(progressTarget)"
                progressRing.setProgress(Float(progressGoal) / Float(progressTarget), animated: true)
                
                if progressGoal == progressTarget {
                    timer.invalidate()
                    incrementWinCount()
                    
                    UserProgressData.gameLevel += 1
                    
                    let main = UIStoryboard(name: "Main", bundle: nil)
                    if let vc = main.instantiateViewController(withIdentifier: "WinViewController") as? WinViewController  {
                        self.navigationController?.pushViewController(vc, animated: true)
                        vc.gameStatistic = [WinModel(time: self.currenTime, correctAnswer: progressGoal, incorrectAnswers: 2)]
                    }
                } else {
                    //
                    collectionView.isUserInteractionEnabled = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [self] in
                        animateCombination()
                    })
                }
            }
            
            
        } else {
            print("WRONG Answer")
            
            
            currentMove = 0
            collectionView.isUserInteractionEnabled = false
            answerBuffer.removeAll()
            
            //
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
        SettingsViewController().playSound()
        SettingsViewController().makeVibration()
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


