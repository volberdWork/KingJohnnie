import UIKit
import Lottie

class GameLoaderViewController: UIViewController {
    var loadingAnimation = LottieAnimationView(name: "92298-loading")
    
    @IBOutlet var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        loadingAnimation.frame = animationView.frame
        self.view.addSubview(loadingAnimation)
        loadingAnimation.loopMode = .repeatBackwards(3.0)
        loadingAnimation.play()
        
    }
    
    
    
    
}
