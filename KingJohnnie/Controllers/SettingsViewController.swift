import UIKit
import MessageUI

class SettingsViewController: UIViewController {

    @IBOutlet var backgraundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.setingsScreenImage)
    }
    
    private func backgraundImageConfige(image: String){
        self.backgraundImage.image = UIImage(named: image)
        self.backgraundImage.contentMode = .scaleAspectFill
    }
    
    @objc func notificationSwitchTapped(sender: UISwitch) {
        UIDevice.vibrate()
        NotificationManager.requestNotifications()
        
        
    }


}
