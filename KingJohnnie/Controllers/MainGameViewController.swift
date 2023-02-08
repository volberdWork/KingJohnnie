import UIKit

class MainGameViewController: UIViewController {
    
    @IBOutlet var backgraundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.mainWinScreenImage)
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
