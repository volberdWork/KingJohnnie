//
//  UserProgressData.swift
//  KingJohnnie
//

import Foundation
import MessageUI
import AVFoundation

struct UserProgressData {
    
        
    static var gameLevel: Int {
        get {
            return UserDefaults.standard.integer(forKey: "gameLevel")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "gameLevel")
        }
    }
}




struct SonundAndVibration{
    
    public func makeVibration(){
        if UserDefaults.standard.bool(forKey: "vibrations"){
            UIDevice().vibrate()
        }else{
            return
        }
    }
    
    public func playSound(){
         if UserDefaults.standard.bool(forKey: "sound"){
             AVAudioPlayer().play()
         }else{
             return
         }
     }
    
}
