//
//  ShakeInteractor.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol AnswerFetcher {
    func fetchAnswer(question: String)
}

class ShakeInteractor: AnswerFetcher {
    
    var presenter: ShakePresentationLogic?
    
    private let worker: AnswerWorker
    
    required init(answerWorker: AnswerWorker){
        self.worker = answerWorker
    }
    
    func fetchAnswer(question: String) {
        
        guard let encodedParameter = question.urlEncoded, !question.isEmpty  else {
            presenter?.presentDefaultAnswers()
            print(Answer.AnswerError.emptyRequest.errorDescription ?? "unknown error")
            return
        }
        
        worker.getAnswer(with: encodedParameter) { [self] (result) in
            
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
