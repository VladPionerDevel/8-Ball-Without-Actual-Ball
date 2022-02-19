//
//  SettingsViewController.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultAnswerTextField: UITextField!
    
    private var defaultValues: DefaultValues = UserDefaultsValues()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        defaultAnswerTextField.text = defaultValues.answer
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        defaultValues.answer = defaultAnswerTextField.text ?? ""
        dismiss(animated: true)
    }
    
}
