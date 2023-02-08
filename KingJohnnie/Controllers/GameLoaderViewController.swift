import UIKit
import Lottie

class GameLoaderViewController: UIViewController {
    @IBOutlet var backGrImage: UIImageView!
    var loadingAnimation = LottieAnimationView(name: "92298-loading")
    
    @IBOutlet var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupView()
        loadingAnimation.frame = animationView.frame
        self.view.addSubview(loadingAnimation)
        loadingAnimation.center = animationView.center
        
        loadingAnimation.loopMode = .repeatBackwards(3.0)
        loadingAnimation.contentMode = .scaleAspectFill
        loadingAnimation.play()
        
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.loadingBackground)
    }
    
    private func backgraundImageConfige(image: String){
        self.backGrImage.image = UIImage(named: image)
        self.backGrImage.contentMode = .scaleAspectFill
    }
    
    
    
    
    
}
