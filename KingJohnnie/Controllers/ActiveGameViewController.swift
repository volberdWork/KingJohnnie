import UIKit

class ActiveGameViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.activeGameImage)
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
        self.backgroundImage.contentMode = .scaleAspectFill
    }
    
    
    
    
}
