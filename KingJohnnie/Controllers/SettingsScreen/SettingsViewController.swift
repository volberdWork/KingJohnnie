import UIKit
import MessageUI

class SettingsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var backgraundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
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



