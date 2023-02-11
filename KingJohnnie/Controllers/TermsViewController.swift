import UIKit

class TermsViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgraundImageConfige(image: Constants.Images.mainGameScreenImage)
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
        self.backgroundImage.contentMode = .scaleAspectFill
    }

}
