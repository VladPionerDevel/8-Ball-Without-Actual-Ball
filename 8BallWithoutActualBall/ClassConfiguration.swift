//
//  ClassConfiguration.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

class ClassConfiguration {
    
    class func shakeModule(configure viewController: ShakeDisplayLogic){
        //MARK: Initialise components.
        let presenter = ShakePresenter(viewController: viewController)
        let interactor = ShakeInteractor(answerWorker: AnswerWorker(), presenter: presenter)
        
        //MARK: link VIP components.
        viewController.interactor = interactor
    }
    
}
