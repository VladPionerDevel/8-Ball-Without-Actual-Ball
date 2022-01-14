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
        let interactor = ShakeInteractor(answerWorker: AnswerWorker())
        let presenter = ShakePresenter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
    
}
