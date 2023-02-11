import UIKit
import MessageUI

class SettingsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backgraundImage: UIImageView!
    var settingsList: [SettingsList] = [
        SettingsList(leftImageName: Constants.Images.icons.profileIcon, nameText: SettingsList.ButtonNameLabel.profile, rightImageName: Constants.Images.icons.arrowIcon, switchIsHidden: true),
        SettingsList(leftImageName: Constants.Images.icons.notificationIcon, nameText: SettingsList.ButtonNameLabel.notification, rightImageName: Constants.Images.icons.arrowIcon, switchIsHidden: true),
        SettingsList(leftImageName: Constants.Images.icons.vibrationIcon, nameText: SettingsList.ButtonNameLabel.vibration, rightImageName: "", switchIsHidden: false),
        SettingsList(leftImageName: Constants.Images.icons.soundIcon, nameText: SettingsList.ButtonNameLabel.sound, rightImageName: "", switchIsHidden: false),
        SettingsList(leftImageName: Constants.Images.icons.termsIcon, nameText: SettingsList.ButtonNameLabel.terms, rightImageName: Constants.Images.icons.arrowIcon, switchIsHidden: true),
        SettingsList(leftImageName: Constants.Images.icons.feedbackIcon, nameText: SettingsList.ButtonNameLabel.feedback, rightImageName: Constants.Images.icons.arrowIcon, switchIsHidden: true),
        SettingsList(leftImageName: Constants.Images.icons.rateIcon, nameText: SettingsList.ButtonNameLabel.rate, rightImageName: Constants.Images.icons.arrowIcon, switchIsHidden: true),
        SettingsList(leftImageName: Constants.Images.icons.removeIcon, nameText: SettingsList.ButtonNameLabel.remove, rightImageName: Constants.Images.icons.arrowIcon, switchIsHidden: true)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        setupView()
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
    }
    
    func openTermsController(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.setingsScreenImage)
        tableView.isScrollEnabled = false
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



struct SettingsList{
    var leftImageName: String
    var nameText: String
    var rightImageName: String
    var switchIsHidden: Bool
    
    enum ButtonNameLabel{
        
        static let profile = "Profile"
        static let notification = "Notifications"
        static let vibration = "Vibration"
        static let sound = "Sound"
        static let terms = "Terms"
        static let feedback = "Feedback"
        static let rate = "Rate Us"
        static let remove = "Remove Progress"
        
    }
}

