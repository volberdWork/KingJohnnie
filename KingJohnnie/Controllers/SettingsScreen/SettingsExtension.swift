import Foundation
import UIKit



extension SettingsViewController : UITableViewDataSource{
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as! SettingsTableViewCell
        cell.backgroundColor = .clear
        cell.configure(model: settingsList[buttonIndex])
        
        if buttonIndex == 2{
            if UserDefaults.standard.bool(forKey: "vibrations"){
                cell.settingsSwitch.setOn(true, animated: false)
                
            } else {
                cell.settingsSwitch.setOn(false, animated: false)
            }
            cell.settingsSwitch.addTarget(self, action: #selector(vibrationSwitchTapped(sender: )), for: .valueChanged)
        }
        
        if buttonIndex == 3{
            if UserDefaults.standard.bool(forKey: "sound"){
                cell.settingsSwitch.setOn(true, animated: false)
            } else {
                cell.settingsSwitch.setOn(false, animated: false)
            }
            cell.settingsSwitch.addTarget(self, action: #selector(soundSwitchTapped(sender: )), for: .valueChanged)
        }
        
        
        
        
       
        return cell
        
    }
    
    
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedButton = indexPath.row
        
        switch selectedButton{
        case 0 : openProfileController()
            playSound()
            makeVibration()
        case 1 : performNotificationSettings()
            playSound()
            makeVibration()
        case 2 : return
        case 3 : return
        case 4 : openTermsController()
            playSound()
            makeVibration()
        case 5 : openMessageWindow()
            playSound()
            makeVibration()
        case 6 : rateAppAction()
            playSound()
            makeVibration()
            
        case 7 : print("")
            playSound()
            makeVibration()
            let alertController = UIAlertController(title: "Attention", message: "Once deleted, your progress will be completely deleted. Are you sure?", preferredStyle: .alert)

            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            // видаляємо прогрес
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // відміна
            }

            alertController.addAction(yesAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true, completion: nil)
            
        default:
            return
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
