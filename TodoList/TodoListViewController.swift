//
//  ViewController.swift
//  TodoList
//
//  Created by partha on 5/18/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var taskStore: TaskStore!
    @IBOutlet var today: UILabel!
    
    @IBAction func addTask(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Task", message: "Add a task message here", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Task Name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            print("Add Alert")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancelled")
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        today?.text = dateFormatter.string(from: Date())
    }
}

//MARK: TableviewController methods
extension TodoListViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.taskName?.text = taskStore.tasks[indexPath.row].taskName
        cell.taskStatus?.text = taskStore.tasks[indexPath.row].completed ? "Completed" : "Pending"

        return cell
    }
}


extension TodoListViewController {
    
}
