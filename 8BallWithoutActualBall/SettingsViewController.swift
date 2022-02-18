//
//  SettingsViewController.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultAnswerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        defaultAnswerTextField.text = UserDefaultsValues.defaultAnswer
    }
    
    @IBAction func saveButtonTapped() {
        UserDefaultsValues.defaultAnswer = defaultAnswerTextField.text ?? ""
        dismiss(animated: true)
    }
    
}
