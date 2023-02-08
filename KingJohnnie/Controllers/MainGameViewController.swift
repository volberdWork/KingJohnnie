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
    
    
}
