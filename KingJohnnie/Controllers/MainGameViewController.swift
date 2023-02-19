import UIKit

class MainGameViewController: UIViewController {
    
    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgraundImage: UIImageView!
    var currentSelected: Int = 6//UserProgressData.gameLevel
    var array: [Int] = []
    
    let currentLevel = 6//UserProgressData.gameLevel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        for i in 0...99{
            self.array.append(i)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.collectionView.scrollToItem(at: IndexPath(item: self.currentLevel, section: 0), at: .centeredHorizontally, animated: true)
        })
        
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.mainWinScreenImage)
        self.collectionView.backgroundColor = .clear
        playButton.backgroundColor = Constants.Colors.orangeColor
        playButton.layer.cornerRadius = 10
        gameNameLabel.text = "Lion Light"
        gameNameLabel.font = UIFont(name: Constants.FontsStrings.PhosphatePro, size: 50)
        
        
    }
    
    private func backgraundImageConfige(image: String){
        self.backgraundImage.image = UIImage(named: image)
        self.backgraundImage.contentMode = .scaleAspectFill
    }
    func openVC(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "GameLoaderViewController") as? GameLoaderViewController  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        SettingsViewController().playSound()
        SettingsViewController().makeVibration()
        openVC()
    }
}


extension MainGameViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCollectionViewCell", for: indexPath) as! LevelCollectionViewCell
        cell.levelLable.text = "Level \(indexPath.row + 1 )"
        
        //
        if indexPath.row <= currentLevel {
            
            cell.lockImage.image = UIImage(named: "openLockImage")
        } else{
            cell.clearCongigureView()
            cell.lockImage.image = UIImage(named: "closeLockImage")
        }
        
        //
        if indexPath.row == currentSelected {
            cell.configureView()
            print("Add selected State")
        }
        
        return cell
    }
    
    
}

extension MainGameViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //add vibration
        
        if indexPath.row != currentSelected && indexPath.row <= currentLevel {
            let cellOld = collectionView.cellForItem(at: IndexPath(item: currentSelected, section: 0)) as! LevelCollectionViewCell
            cellOld.clearCongigureView()
            
            let cell = collectionView.cellForItem(at: indexPath) as! LevelCollectionViewCell
            cell.configureView()
            
            currentSelected = indexPath.row
            
        }
    }
    
    
}


extension MainGameViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 50, height: 50)
    }
}
