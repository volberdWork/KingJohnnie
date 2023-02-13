import Foundation
import UIKit

class CustomPopUp {
    
    var title: String
    var message: String
    var buttonText: String
    var buttonAction: (() -> Void)?
    
    init(title: String, message: String, buttonText: String, buttonAction: (() -> Void)?) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }
    
    func show() {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default) { _ in
            self.buttonAction?()
        }
        alert.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
}
