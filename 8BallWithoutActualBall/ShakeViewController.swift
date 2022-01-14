//
//  ViewController.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import UIKit

protocol ShakeDisplayLogic: class {
    var interactor: ShakeBisnesLogic? {get set}
    func displayAnswer(viewModel: AnswerEntity.ViewModel)
}

class ShakeViewController: UIViewController, ShakeDisplayLogic {
    
    var interactor: ShakeBisnesLogic?
    
    @IBOutlet weak var answerLabel: UILabel!
    
    private let callToShakeText = "Shaking to get an answer"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ClassConfiguration.shakeModule(configure: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAnswerLabel()
    }
    
    func displayAnswer(viewModel: AnswerEntity.ViewModel) {
        answerLabel.text = viewModel.message
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerLabel.text = "..."
        interactor?.fetchAnswer()
    }
    
    @IBAction func gearTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        guard let settingsVC = vc else {return}
        present(settingsVC, animated: true) { [unowned self] in
            setAnswerLabel()
        }
    }
    
    private func setAnswerLabel(){
        answerLabel.text = callToShakeText
    }
}

