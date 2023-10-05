//
//  DetailViewController.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 4.10.2023.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var updateTextField: UITextField!
    
    // MARK: - Properties
    var toDos: ToDoItem?
    let datailViewModel = TodosDetailViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = toDos {
            updateTextField.text = t.name
        }
    }

    // MARK: - Action
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        if let name = updateTextField.text, let t = toDos {
            datailViewModel.update(id: t.id!, name: name)
        }
    }
    
}
