import UIKit
import ALProgressView

class ActiveGameViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var darkView: UIView!
    
    @IBOutlet var progressRing: ALProgressRing!
    
    @IBOutlet var timerLabel: UILabel!
    var time = 0
    var timer = Timer()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        progressRing.setProgress(0.0, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            timerStart()
            progressRing.lineWidth = 10
            progressRing.tintColor = .yellow
            progressRing.startColor = Constants.Colors.orangeColor
            progressRing.grooveColor = .brown
            progressRing.tintColor = .white
            progressRing.endColor = Constants.Colors.orangeColor
            progressRing.setProgress(0.8, animated: true)
            timerStart()
         
            
           

     
        }
        
        
        
        
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.activeGameScreen)
    }
    
    private func timerStart(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let minutes = self.time / 60 % 60
            let seconds = self.time % 60
            self.timerLabel.text = String(format:"%02i:%02i", minutes, seconds)
            self.time += 1
        }
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
        self.backgroundImage.contentMode = .scaleAspectFill
        self.collectionView.backgroundColor = .clear
    }
    
    
    
    @IBAction func pressedPauseButon(_ sender: UIButton) {
        let popUpView = OverLayerView()
        popUpView.appear(sender: self)
        self.timer.invalidate()
      
        
    }
    
}


extension ActiveGameViewController: UICollectionViewDelegate{
    
}


extension ActiveGameViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveGameCollectionViewCell", for: indexPath) as! ActiveGameCollectionViewCell
        
        
        
        return cell
    }
    
    
}
