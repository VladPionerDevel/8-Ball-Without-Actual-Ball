//
//  ShakeInteractor.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol ShakeBisnesLogic {
    func fetchAnswer(stringParameter: String)
}

class ShakeInteractor: ShakeBisnesLogic {
    
    var presenter: ShakePresentationLogic?
    
    private let worker: AnswerWorker
    
    required init(answerWorker: AnswerWorker){
        self.worker = answerWorker
    }
    
    func fetchAnswer(stringParameter: String) {
        
        guard let parametrEncoded = stringParameter.urlEncode, stringParameter != ""  else {
            presenter?.presentDefaultAnswers()
            print(AnswerEntity.AnswerError.emptyRequest.errorDescription ?? "unknown error")
            return
        }
        
        worker.getAnswer(parametr: parametrEncoded) { [self] (result) in
            
            switch result {
            case .success(let answer):
                presenter?.presentAnswer(answer: answer)

            case .failure(let error):
                presenter?.presentDefaultAnswers()
                print(error.errorDescription ?? "unknown error")
            }
            
        }
    }
    
}
