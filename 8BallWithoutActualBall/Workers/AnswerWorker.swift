//
//  AnswerWorker.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol AnswerWorkerProtocol {
    func getAnswer(parametr: String, callBack: @escaping (_ result: Result<AnswerEntity.Response, AnswerEntity.AnswerError>) -> Void)
}

class AnswerWorker: AnswerWorkerProtocol {
    
    func getAnswer(parametr: String, callBack: @escaping (_ result: Result<AnswerEntity.Response, AnswerEntity.AnswerError> ) -> Void) {
        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/" + parametr) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let _ = error {
                callBack(.failure(.connectionError))
                return
            }
            
            guard let data = data else {
                callBack(.failure(.connectionError))
                return
            }
            
            do {
                let answerResponse = try JSONDecoder().decode(AnswerEntity.Response.self, from: data)
                
                if let answerText = answerResponse.magic?.answer, answerText != "" {
                    callBack(.success(answerResponse))
                } else {
                    callBack(.failure(.emptyAnswer))
                }
                
            } catch {
                callBack(.failure(.connectionError))
            }
            
        }.resume()
    }
    
}

