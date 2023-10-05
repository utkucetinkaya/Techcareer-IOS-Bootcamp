//
//  ToDoListViewModel.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 5.10.2023.
//

import RxSwift

class ToDoListViewModel {
    
    let toDoRepo = ToDoDaoRepository()
    var toDoList = BehaviorSubject<[ToDoItem]>(value: [ToDoItem]())
    
    init() {
        toDoRepo.copyDatabase()
        toDoList = toDoRepo.toDoList
    }
    
    // MARK: - Functions
    
    func search(searchText: String) {
        toDoRepo.search(searchText: searchText)
    }
    
    func deleteToDo(id: Int) {
        toDoRepo.deleteToDo(id: id)
        setupToDo()
    }
    
    func setupToDo() {
        toDoRepo.setupToDos()
    }
}
