//
//  ViewController.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import UIKit

protocol ShakeDisplayLogic: class {
    var interactor: AnswerFetcher? {get set}
    func displayAnswer(viewModel: Answer.DisplayedData)
}

class ShakeViewController: UIViewController, ShakeDisplayLogic {
    
    var interactor: AnswerFetcher?
    
    @IBOutlet weak var rotationView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    
    private let callToShakeText = "Shaking to get an answer"
    
    private var animationRoataion: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = CATransform3DMakeRotation(0, 0, 1, 0)
        animation.toValue = CATransform3DMakeRotation(.pi, 0, 1, 0)
        animation.duration = 0.12
        animation.repeatCount = .infinity
        return animation
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ClassConfiguration.shakeModule(configure: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRotationView()
        setAnswerLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        setTransformeLayer(for: rotationView)
    }
    
    func displayAnswer(viewModel: Answer.DisplayedData) {
        answerLabel.text = viewModel.message
        rotationView.layer.removeAllAnimations()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerLabel.isHidden = true
        self.rotationView.backgroundColor = .systemPurple
        interactor?.fetchAnswer(question: "77777")
        
        addAnimationRotaion(to: rotationView) { [weak self] in
            if self != nil {
                self!.answerLabel.isHidden = false
            }
        }
    }
    
    @IBAction func gearTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: SettingsViewController.self))
        guard let settingsVC = vc else {return}
        present(settingsVC, animated: true) { [unowned self] in
            setAnswerLabel()
            rotationView.backgroundColor = .systemGray4
        }
    }
    
    private func setTransformeLayer(for view: UIView){
        let transformLayer = CATransformLayer()
        var perspective = CATransform3DIdentity
        perspective.m34 = 1.0 / -2000
        transformLayer.transform = perspective
        
        transformLayer.addSublayer(view.layer)
        self.view.layer.addSublayer(transformLayer)
    }
    
    private func addAnimationRotaion(to view: UIView, completion: @escaping () -> Void ){
        
        CATransaction.setCompletionBlock {
            completion()
        }
        
        view.layer.add(animationRoataion, forKey: "transform")
    }
    
    private func setRotationView(){
        rotationView.layer.cornerRadius = rotationView.frame.width / 2
        rotationView.backgroundColor = .systemGray4
    }
    
    private func setAnswerLabel(){
        answerLabel.text = callToShakeText
    }
}



