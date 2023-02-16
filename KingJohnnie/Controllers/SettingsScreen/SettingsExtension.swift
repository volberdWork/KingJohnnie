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
        
        
        
        
       
        return cell
        
    }
    
    
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedButton = indexPath.row
        
        switch selectedButton{
        case 0 : openProfileController()
        case 1 : performNotificationSettings()
        case 2 : return
        case 3 : return
        case 4 : openTermsController()
        case 5 : openMessageWindow()
        case 6 : rateAppAction()
        case 7 : print("")
            
        default:
            return
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
