//
//  AddToDosViewModel.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 5.10.2023.
//

import Foundation

class AddToDosViewModel {
    
    // MARK: - Properties
    
    let toDoRepo = ToDoDaoRepository()
    
    // MARK: - Functions
    
    func save(name: String) {
        toDoRepo.save(name: name)
    }
}
