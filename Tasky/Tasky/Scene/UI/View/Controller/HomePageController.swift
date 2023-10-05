//
//  ViewController.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 3.10.2023.
//

import UIKit
import RxSwift

class HomePageController: UIViewController {

    // MARK: - UIElements

    @IBOutlet weak  var toDoListTableView: UITableView!
    @IBOutlet weak  var toDoListSearchBar: UISearchBar!
    
    // MARK: - Properties
    
    var toDos = [ToDoItem]()
    let viewModel = ToDoListViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        
        _ = self.viewModel.toDoList.subscribe(onNext: { list in
            self.toDos = list
            self.toDoListTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.setupToDo()
    }

    // MARK: - SetDelegate
    private func setDelegate() {
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
        toDoListSearchBar.delegate = self
    }
    
//     MARK: - Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? ToDoItem {
                let roadVC = segue.destination as! DetailViewController
                roadVC.toDos = toDo
            }
        }
    }
}

// MARK: - UITableViewProtocol

extension HomePageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell" ) as! ToDosCell
        
        let toDos = toDos[indexPath.row]
        cell.titleLabel.text = toDos.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDos = toDos[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: toDos)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let toDo = self.toDos[indexPath.row]
            let alert = UIAlertController(title: "Silme islemi", message: "\(toDo.name ?? "")silinsin mi?", preferredStyle: .alert)
            let cancelActions = UIAlertAction(title: "Iptal", style: .cancel)
            alert.addAction(cancelActions)
            let yesActions = UIAlertAction(title: "Evet", style: UIAlertAction.Style.destructive) { action in
                self.viewModel.deleteToDo(id: toDo.id!)
            }
            
            alert.addAction(yesActions)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

// MARK: - SearchBarProtocol
//
extension HomePageController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}
