//
//  ShakeInteractor.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol ShakeBisnesLogic {
    func fetchAnswer(parameter: String)
}

class ShakeInteractor: ShakeBisnesLogic {
    
    var presenter: ShakePresentationLogic?
    
    private let worker: AnswerWorker
    
    required init(answerWorker: AnswerWorker){
        self.worker = answerWorker
    }
    
    func fetchAnswer(parameter: String) {
        
        guard let encodedParametr = parameter.urlEncoded, parameter != ""  else {
            presenter?.presentDefaultAnswers()
            print(AnswerEntity.AnswerError.emptyRequest.errorDescription ?? "unknown error")
            return
        }
        
        worker.getAnswer(with: encodedParametr) { [self] (result) in
            
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
