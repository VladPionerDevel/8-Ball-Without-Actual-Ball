//
//  ShakePresenter.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol ShakePresentationLogic {
    func presentAnswer(answer: Answer.Response)
    func presentDefaultAnswers()
}

class ShakePresenter: ShakePresentationLogic {
    
    weak var viewController: ShakeDisplayLogic?
    
    func presentAnswer(answer: Answer.Response) {
        guard let answerText = answer.magic?.answer else {
            self.presentDefaultAnswers()
            return
        }
        let answerViewModel = makeAnswerDisplayedData(answerText: answerText)
        displayAnswerInMainThread(viewModel: answerViewModel)
    }
    
    func presentDefaultAnswers()  {
        let answerViewModel = makeAnswerDisplayedData(answerText: UserDefaultsValues.defaultAnswer)
        displayAnswerInMainThread(viewModel: answerViewModel)
    }
    
    private func displayAnswerInMainThread(viewModel: Answer.DisplayedData){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard self != nil else {return}
            self!.viewController?.displayAnswer(viewModel: viewModel)
        }
    }
    
    private func makeAnswerDisplayedData(answerText: String) -> Answer.DisplayedData {
        return Answer.DisplayedData(message: answerText)
    }
    
}
