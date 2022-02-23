//
//  ClassConfiguration.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

struct ClassConfiguration {
    
    func shakeModule(configure viewController: ShakeDisplayLogic) {
        let presenter = ShakePresenter(viewController: viewController, defaultValues: DefaultValues() as DefaultAnswerProvider)
        let interactor = ShakeInteractor(answerWorker: AnswerWorker(), presenter: presenter)
        
        viewController.interactor = interactor
    }
    
}
