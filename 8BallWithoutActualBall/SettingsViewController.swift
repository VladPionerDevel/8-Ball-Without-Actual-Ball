//
//  SettingsViewController.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 14.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultAnswerTextField: UITextField!
    
    var defaultValues: DefaultAnswerProvider
    
    init?(coder: NSCoder, defaultValues: DefaultAnswerProvider) {
        self.defaultValues = defaultValues
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a user.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultAnswerTextField.text = defaultValues.answer
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        defaultValues.answer = defaultAnswerTextField.text ?? ""
        dismiss(animated: true)
    }
    
}
