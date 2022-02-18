//
//  UserDefaultsValues.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

class UserDefaultsValues {
    
    private static let userDefaults = UserDefaults.standard
    private static let initialDefaultAnswer = "Just do it!"
    
    private enum Keys: String {
        case defaultAnswer = "defaultAnswer"
    }
    
    static var defaultAnswer: String {
        get {
            let answer = userDefaults.string(forKey: Keys.defaultAnswer.rawValue)
            
            guard let defaultAnswerFromStorage = answer else {
                self.defaultAnswer = initialDefaultAnswer
                return initialDefaultAnswer
            }
            
            return defaultAnswerFromStorage
        }
        set {
            userDefaults.setValue(newValue, forKey: Keys.defaultAnswer.rawValue)
        }
    }
    
}

