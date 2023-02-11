import Foundation
import UIKit

extension SettingsViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let buttonIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as! SettingsTableViewCell
        cell.backgroundColor = .clear
        cell.settingsSwitch.isHidden = true
        
        switch buttonIndex{
        case 0 : cell.settingsNameLabel.text = "Profile"
        case 1 : cell.settingsNameLabel.text = "Profile"
        case 2 : cell.settingsNameLabel.text = "Profile"
        case 3 : cell.settingsNameLabel.text = "Profile"
        case 4 : cell.settingsNameLabel.text = "Profile"
        case 5 : cell.settingsNameLabel.text = "Profile"
        case 6 : cell.settingsNameLabel.text = "Profile"
        case 7 : cell.settingsNameLabel.text = "Profile"
        default:
            return cell
        }
        return cell
//
//        if indexPath.row == 2 || indexPath.row == 3{
//            cell.settingsNameLabel.text = "Asaw"
//            cell.settingsSwitch.isHidden = false
//
//        } else{
//            cell.disclosureIcon.image = UIImage(named: Constants.Images.icons.arrowIcon)
//
//
//        }
//
//        cell.iconButtonImage.image = UIImage(named: Constants.Images.icons.profileIcon)
//        return cell
    }
    
    
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Комірка номер: \(indexPath.row)")
       
    }
    
    
}
