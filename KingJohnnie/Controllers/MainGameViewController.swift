import UIKit

class MainGameViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgraundImage: UIImageView!
    var currentSelected: Int? = 0
    var array: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        for i in 0...99{
            self.array.append(i)
        }
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.mainWinScreenImage)
        self.collectionView.backgroundColor = .clear
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
        if indexPath.row == self.currentSelected{
            cell.configureView()
        } else{
            cell.clearCongigureView()
        }
        return cell
    }
    
    
}

extension MainGameViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.row
        print(currentSelected)
        collectionView.reloadData()
    }
}


extension MainGameViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 50, height: 50)
    }
}

