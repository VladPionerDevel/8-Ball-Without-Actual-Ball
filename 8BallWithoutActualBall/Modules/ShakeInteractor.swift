//
//  ShakeInteractor.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol ShakeBisnesLogic {
    func fetchAnswer()
}

class ShakeInteractor: ShakeBisnesLogic {
    
    var presenter: ShakePresentationLogic?
    
    private let worker: AnswerWorker
    
    required init(answerWorker: AnswerWorker){
        self.worker = answerWorker
    }
    
    func fetchAnswer() {
        worker.getAnswer(parametr: "7777777") { [self] (result) in
            
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
