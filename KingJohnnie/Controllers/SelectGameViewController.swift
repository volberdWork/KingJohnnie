import UIKit

class SelectGameViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private  func setupView(){
        logoForNavigationBar()
        backgraundImage(image: Constants.Images.mainGameScreenImage)
    }
    
    private func backgraundImage(image: String){
        self.backgroundImage.image = UIImage(named: image)
    }
    
    private func logoForNavigationBar(){
        let logo = UIImage(named: Constants.Images.logo)
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        imageView.contentMode = .scaleAspectFit
    }
    
    
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
        
    }
}

