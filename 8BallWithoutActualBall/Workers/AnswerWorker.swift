//
//  AnswerWorker.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation
import Alamofire

protocol AnswerWorkerProtocol {
    func getAnswer(with parametr: String, callBack: @escaping (_ result: Result<AnswerEntity.Response, AnswerEntity.AnswerError>) -> Void)
}

class AnswerWorker: AnswerWorkerProtocol {
    
    func getAnswer(with parametr: String, callBack: @escaping (_ result: Result<AnswerEntity.Response, AnswerEntity.AnswerError>) -> Void) {
        AF.request("https://8ball.delegator.com/magic/JSON/" + parametr).validate()
            .responseDecodable(of: AnswerEntity.Response.self) { response in
                
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

