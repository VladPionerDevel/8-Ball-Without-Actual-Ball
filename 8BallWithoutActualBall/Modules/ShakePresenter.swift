//
//  ShakePresenter.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import Foundation

protocol ShakePresentationLogic {
    func presentAnswer(answer: AnswerEntity.Response)
    func presentDefaultAnswers()
}

class ShakePresenter: ShakePresentationLogic {
    
    weak var viewController: ShakeDisplayLogic?
    
    func presentAnswer(answer: AnswerEntity.Response) {
        guard let answerText = answer.magic?.answer else {
            self.presentDefaultAnswers()
            return
        }
        let answerViewModel = createAnswerViewModel(answerText: answerText)
        displayAnswerInMainThread(viewModel: answerViewModel)
    }
    
    func presentDefaultAnswers()  {
        let answerViewModel = createAnswerViewModel(answerText: "Deffault answer")
        displayAnswerInMainThread(viewModel: answerViewModel)
    }
    
    private func displayAnswerInMainThread(viewModel: AnswerEntity.ViewModel){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard self != nil else {return}
            self!.viewController?.displayAnswer(viewModel: viewModel)
        }
    }
    
    private func createAnswerViewModel(answerText: String) -> AnswerEntity.ViewModel {
        return AnswerEntity.ViewModel(message: answerText)
    }
    
}
