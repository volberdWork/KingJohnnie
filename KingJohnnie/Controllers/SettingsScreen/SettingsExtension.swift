import Foundation
import UIKit

extension SettingsViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as! SettingsTableViewCell
        cell.backgroundColor = .clear
        cell.settingsSwitch.isHidden = true
        
        if indexPath.row == 2 || indexPath.row == 3{
            cell.settingsNameLabel.text = "Asaw"
            cell.settingsSwitch.isHidden = false
            
        } else{
            cell.disclosureIcon.image = UIImage(named: Constants.Images.losseImage)
        
            
        }
        
        cell.iconButtonImage.image = UIImage(named: Constants.Images.losseImage)
        return cell
    }
    
    
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Комірка номер: \(indexPath.row)")
       
    }
    
    
}
