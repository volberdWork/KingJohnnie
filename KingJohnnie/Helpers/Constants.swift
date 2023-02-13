import Foundation
import UIKit

enum Constants {
    
    
    enum Colors {
        static let whiteColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        static let greyColor = UIColor(displayP3Red:  0.678, green:  0.678, blue:  0.678, alpha: 1)
        static let orangeColor = UIColor(displayP3Red: 237/255, green: 133/255, blue: 44/255, alpha: 1)
        static let alphaOrange = UIColor(displayP3Red: 167/255, green: 127/255, blue: 93/255, alpha: 0.2)
    }
    
    enum Images {
        static let loaderBackground = "loaderBackground"
        static let loadingBackground = "loadingBackground"
        static let loseScreenImage = "lossScreenImage"
        static let mainWinScreenImage = "mainWinScreenImage"
        static let mainGameScreenImage = "mainGameScreenImage"
        static let logo = "logo"
        static let setingsScreenImage = "setingsScreenImage"
        static let activeGameImage = "activeGameImage"
        static let starGrayLevelIcon = "starGrayLevelIcon"
        static let starOrangeLevelIcon = "starOrangeLevelIcon"
        static let activeGameScreen = "activeGameScreen"
        static let winImage = "winImage"
        static let homeButtonImage = "homeButtonImage"
        static let losseImage = "losseImage"
        
        enum icons{
            static let profileIcon = "profileIcon"
            static let notificationIcon = "notificationIcon"
            static let vibrationIcon = "vibrationIcon"
            static let soundIcon = "soundIcon"
            static let termsIcon = "termsIcon"
            static let feedbackIcon = "feedbackIcon"
            static let rateIcon = "rateIcon"
            static let removeIcon = "removeIcon"
            static let arrowIcon = "arrowIcon"
            static let backButton = "backButton"
        }
    }
    
    enum FontsStrings{
        static let PhosphatePro = "PhosphatePro-Inline"
        static let InterMedium = "Inter-Medium"
        static let InterBold = "Inter-Bold"
    }
    
    enum LottieAnimation{
        static let loading = "92298-loading"
    }
}
