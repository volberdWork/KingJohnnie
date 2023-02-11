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
        cell.configure(model: settingsList[indexPath.row])
        return cell
        
    }
    
    
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedButton = indexPath.row
        
        switch selectedButton{
        case 0 : print(selectedButton)
        case 1 : print(selectedButton)
        case 2 : return
        case 3 : return
        case 4 : openTermsController()
        case 5 : print(selectedButton)
        case 6 : print(selectedButton)
        case 7 : print(selectedButton)
            
        default:
            return
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
