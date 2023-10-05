//
//  AddToDosController.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 5.10.2023.
//

import UIKit

class AddToDosController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: - Properties
    
    let viewModel = AddToDosViewModel()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action

    @IBAction func kaydetButtonPressed(_ sender: Any) {
        if let name = titleTextField.text {
            viewModel.save(name: name)
        }
    }
}
