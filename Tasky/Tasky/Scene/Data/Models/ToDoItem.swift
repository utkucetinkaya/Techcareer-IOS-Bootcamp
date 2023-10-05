//
//  ToDosModel.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 4.10.2023.
//

import Foundation

class ToDoItem {
    var id : Int?
    var name: String?
    
    init() {
    }

    init(id: Int? = nil, name: String? = nil) {
        self.id = id
        self.name = name
    }
}
