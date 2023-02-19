import UIKit

class SelectGameViewController: UIViewController {
    
    @IBOutlet var detailsButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    var numberOfItemCollectionView = 0
    var collectionArray: [SelectGameCellModel] = [
        SelectGameCellModel(
            gameName: "KING OF LIGHT",
            owerview: "This is not a very difficult game that king johnny offers to everyone. A large number of people tried to pass this test, but only a few succeeded. Are you ready to see what this challenge is?",
            levelStars: 3
        ),
        SelectGameCellModel(
            gameName: "MIND MAZE",
            owerview: "Labyrinths are always more than just a thing. Especially this one Only those who really have deep consciousness passed this labyrinth. Well, let's see what you really are?",
            levelStars: 2
        ),
        SelectGameCellModel(
            gameName: "LIGHTING STRIKE",
            owerview: "A lightning strike is an uncontrollable and mystical phenomenon. It used to be. But what is it now? This game will require quick reaction and lightning speed. Let's see if you can beat nature itself?",
            levelStars: 5
        ),
        SelectGameCellModel(
            gameName: "WAY OF TRUTH",
            owerview: "The path of truth is the path of a strong man. Well, here you will have to be honest, first of all - to yourself",
            levelStars: 4
        ),
        SelectGameCellModel(
            gameName: "RIDDLE OF KING",
            owerview: "How many secrets does the king have? And so, the moment has come when you got to play with the king himself, if you are lucky - you will become a legend",
            levelStars: 5
        )
    ]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        detailsButton.titleLabel?.text = "DETAILS"
        detailsButton.titleLabel?.font = UIFont(name: Constants.FontsStrings.InterBold, size: 17)
        pageControl.numberOfPages = self.collectionArray.count
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
        if pageControl.currentPage == 0{
            openMaiGamenController()
            sender.titleLabel?.text = "DETAILS"
            sender.titleLabel?.font = UIFont(name: Constants.FontsStrings.InterBold, size: 17)
            SettingsViewController().playSound()
            SettingsViewController().makeVibration()
        } else{
            let alert = UIAlertController(title: "Game Closed",
                                          message: "This game is closed until Johnnie gives you permission. The permission will be granted after passing level 50 in the royal game.",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
        SettingsViewController().playSound()
        SettingsViewController().makeVibration()
    }
}

extension SelectGameViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectGameCollectionViewCell", for: indexPath) as! SelectGameCollectionViewCell
        cell.configure(model: collectionArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 331, height: 363)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.isPagingEnabled = true
    }
}
