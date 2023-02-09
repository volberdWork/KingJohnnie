import UIKit

class SelectGameViewController: UIViewController {
    @IBOutlet var detailsButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    var collectionArray: [SelectGameCellModel] = [SelectGameCellModel(gameName: "Lion King", owerview: "Improve a lion inside yourself,  ability to hold the info in the mind temporarly ", levelStars: 3),
                                                  SelectGameCellModel(gameName: "Lion Fad", owerview: "Improve a lion inside yourself,  ability to hold the info in the mind temporarly ", levelStars: 2),
                                                  SelectGameCellModel(gameName: "SDF ewE", owerview: "Improve a lion inside yourself,  ability to hold the info in the mind temporarly ", levelStars: 5),
                                                  SelectGameCellModel(gameName: "SEWWE", owerview: "dfgherwecds", levelStars: 4),
                                                  SelectGameCellModel(gameName: "qasdcw", owerview: "qwdcs3qad", levelStars: 1),]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        detailsButton.titleLabel?.text = "DETAILS"
        detailsButton.titleLabel?.font = UIFont(name: Constants.FontsStrings.InterBold, size: 17)
        
    }
    
    private  func setupView(){
        logoForNavigationBar()
        backgraundImageConfige(image: Constants.Images.mainGameScreenImage)
        congigurePageControl()
        confiureButton()
        
    }
    
    private func confiureButton(){
        self.collectionView.backgroundColor = .clear
        self.detailsButton.layer.cornerRadius = 10
        self.detailsButton.layer.borderWidth = 0.5
        let whiteColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.detailsButton.layer.borderColor = whiteColor
        
    }
    
    
    
    
    
    private func congigurePageControl(){
        self.pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
       
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
    }
    
    private func logoForNavigationBar(){
        let logo = UIImage(named: Constants.Images.logo)
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        imageView.contentMode = .scaleAspectFit
    }
    
    func openMaiGamenController(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "MainGameViewController") as? MainGameViewController  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func openSettingController(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    
    @IBAction func detailsButtonPressed(_ sender: UIButton) {
        openMaiGamenController()
        sender.titleLabel?.text = "DETAILS"
        sender.titleLabel?.font = UIFont(name: Constants.FontsStrings.InterBold, size: 17)
    }
    
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}


extension SelectGameViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectGameCollectionViewCell", for: indexPath) as! SelectGameCollectionViewCell
        cell.configure(model: collectionArray[indexPath.row])
        return cell
    }
    
    
}


extension SelectGameViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 331, height: 363)
    }
}

