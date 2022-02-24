//
//  UserDefaultsValues.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol DefaultAnswerProvider {
    var answer: String { mutating get set }
}

struct DefaultValues: DefaultAnswerProvider {
    
    private let userDefaults = UserDefaults.standard
    private let initialDefaultAnswer = "Just do it!"
    
    private enum Keys: String {
        case defaultAnswer = "defaultAnswer"
    }
    
    var answer: String {
        mutating get {
            let answer = userDefaults.string(forKey: Keys.defaultAnswer.rawValue)
            
            guard let defaultAnswerFromStorage = answer else {
                self.answer = initialDefaultAnswer
                return initialDefaultAnswer
            }
            
            return defaultAnswerFromStorage
        }
        set {
            userDefaults.setValue(newValue, forKey: Keys.defaultAnswer.rawValue)
        }
    }
    
}

