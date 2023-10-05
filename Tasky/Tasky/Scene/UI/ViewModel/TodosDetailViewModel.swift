//
//  TodosDetailViewModel.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 5.10.2023.
//

import Foundation
import UIKit

class TodosDetailViewModel {
    
    // MARK: - Properties
    let toDoRepo = ToDoDaoRepository()
    
    // MARK: - Functions
    
    func update(id: Int, name: String) {
        toDoRepo.update(id: id, name: name)
    }
}
