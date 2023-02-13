import UIKit
import MessageUI
import StoreKit
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
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setupView()
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
     
    }
    
    func rateAppAction() {

        //check status of user OS
        if #available(iOS 14.0, *) {
            //request review in another situation
                if let sceneNew = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: sceneNew)
                }

        } else {

            //request review
            SKStoreReviewController.requestReview()
        }
    }

    
    func openTermsController(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func openProfileController(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func performNotificationSettings() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
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
    
    @objc func vibrationSwitchTapped(sender: UISwitch) {
        if sender.isOn {
            sender.thumbTintColor = .yellow
            UserDefaults.standard.set(true, forKey: "vibrations")
            print(UserDefaults.standard.set(true, forKey: "vibrations"))
            UIDevice.vibrate()
        } else {
            sender.thumbTintColor = .yellow.withAlphaComponent(0.5)
            UserDefaults.standard.set(false, forKey: "vibrations")
        }
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

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    //create converastional windiw
    func openMessageWindow() {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail Service is NOT available")
            
            let errorController = UIAlertController(title: "Dear User", message: "Sorry, buy Write To Us Service is temporarily unavailable. Please Try Again Later.", preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            errorController.addAction(okAction)
            present(errorController, animated: true)
            
            return
            
        } else {
            
            print("Mail Service IS working")
            
            let composeController = MFMailComposeViewController()
            composeController.mailComposeDelegate = self

            // Configure the fields of the interface.
            composeController.setToRecipients(["stakeYourSkillsFeedback@gmail.com"])
            composeController.setSubject("Message Subject")
            composeController.setMessageBody("Message content", isHTML: false)

            self.present(composeController, animated: true, completion: nil)
            
        }
        

    }
}
