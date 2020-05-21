//
//  ViewController.swift
//  TodoList
//
//  Created by partha on 5/18/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, TaskCellDelegate, detailViewControllerDelegate {
    
    func saveData(task: Task) {
        print(task)
           taskStore.tasks[selectedIndex] = task
            tableView.reloadData()
    }

    func btnTaskTapped(cell: TaskCell) {
       let indexPath = self.tableView.indexPath(for: cell)!
       taskStore.tasks[indexPath.row].completed = !taskStore.tasks[indexPath.row].completed
        tableView.reloadData()
    }

    @IBOutlet var tableView: UITableView!
    var taskStore: TaskStore!
    @IBOutlet var today: UILabel!
    var addTask: String = ""
    var selectedIndex: Int!
    
    @IBAction func addTask(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Task", message: "Add a task message here", preferredStyle: .alert)
        alertController.addTextField { (textField) in
                textField.placeholder = "Enter Task Name"
                textField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            let newTask = self.taskStore.addTask(taskName: self.addTask)
            
            if let index = self.taskStore.tasks.firstIndex(of: newTask) {
               let indexPath = IndexPath(row: index, section: 0)
               self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
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
    
    @objc func textFieldDidChange (_ sender: UITextField) {
        if let text = sender.text {
            addTask = text
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskDetail" {
            if let row = tableView.indexPathForSelectedRow?.row{
                let task = taskStore.tasks[row]
                let detailViewController = segue.destination as! TaskDetailViewController
                detailViewController.delegate = self
                detailViewController.task = task
            }
        }
    }
}

//MARK: TableviewController methods
extension TodoListViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.delegate = self
        cell.taskName?.text = taskStore.tasks[indexPath.row].taskName
        cell.taskStatus?.text = taskStore.tasks[indexPath.row].completed ? "Completed" : "Pending"
        let imageName = cell.taskStatus?.text == "Completed" ? "radioButtonSeleted" : "radioButton"
        cell.radioButton.setImage(UIImage(named: imageName), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskStore.deleteTask(task: taskStore.tasks[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "taskDetail", sender: self)
    }
}


extension TodoListViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
}
