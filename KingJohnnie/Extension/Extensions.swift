import Foundation
import UIKit
import AudioToolbox

extension UIDevice {
    
     func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
   
    
}

