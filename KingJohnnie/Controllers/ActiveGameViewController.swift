import UIKit

class ActiveGameViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var darkView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
       
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.activeGameScreen)
        darkView.backgroundColor = .black
        darkView.alpha = 0.5
        
        self.darkView.isHidden = true
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
        self.backgroundImage.contentMode = .scaleAspectFill
        self.collectionView.backgroundColor = .clear
    }
    
    
    
    @IBAction func pressedPauseButon(_ sender: UIButton) {
       let popUpView = OverLayerView()
        popUpView.appear(sender: self)

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
