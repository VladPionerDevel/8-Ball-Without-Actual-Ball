//
//  AnswerEntity.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation


struct AnswerEntity {
    
    struct Response: Codable {
        let magic: Magic?
    }
    
    struct Magic: Codable {
        let question: String?
        let answer: String?
        let type: String?
    }
    
    struct ViewModel {
        let message: String
    }
    
    enum AnswerError: Error {
        case connectionError
        case emptyAnswer
        case emptyRequest
    }
    
}

extension AnswerEntity.AnswerError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .connectionError:
            return "Server Error or Inthernet connection Error"
        case .emptyAnswer:
            return "Empty Answer"
        case .emptyRequest:
            return "Empty Request"
        }
    }
    
}
