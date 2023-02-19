//
//  UserProgressData.swift
//  KingJohnnie
//

import Foundation


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


