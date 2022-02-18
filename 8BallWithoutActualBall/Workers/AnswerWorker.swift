//
//  AnswerWorker.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation
import Alamofire

protocol AnswerGetting {
    func getAnswer(with parametr: String, callBack: @escaping (_ result: Result<Answer.Response, Answer.AnswerError>) -> Void)
}

class AnswerWorker: AnswerGetting {
    
    func getAnswer(with parametr: String, callBack: @escaping (_ result: Result<Answer.Response, Answer.AnswerError>) -> Void) {
        AF.request("https://8ball.delegator.com/magic/JSON/" + parametr).validate()
            .responseDecodable(of: Answer.Response.self) { response in
                
                switch response.result {
                case .success(let products):
                    callBack(.success(products))
                case .failure(let error):
                    print(error)
                    callBack(.failure(.connectionError))
                }
            }
    }
    
}

