//
//  TaskDetailViewController.swift
//  TodoList
//
//  Created by partha on 5/19/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit
protocol detailViewControllerDelegate: AnyObject {
    func saveData(task: Task)
}

class TaskDetailViewController: UIViewController, UITextFieldDelegate{
    
    var task: Task?
    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskStatus: UILabel!
    @IBOutlet var toggleStatus: UISwitch!
    @IBOutlet var taskNotes: UITextView!
    
    weak var delegate: detailViewControllerDelegate?
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTask(_ sender: Any) {
        if let task = task {
            delegate?.saveData(task: task)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func taskStatusUpdated(_ sender: Any) {
        if let task = task {
            if toggleStatus.isOn {
                task.completed = true
            } else {
                task.completed = false
            }
             taskStatus.text = task.completed ? "Completed" : "Pending"
        }
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let taskNameText = task?.taskName, let taskStatusV = task?.completed {
            taskName.text = taskNameText
            taskStatus.text = taskStatusV ? "Completed" : "Pending"
            toggleStatus.setOn(taskStatusV ? true : false, animated: animated)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        view.endEditing(true)
        if let task = task {
            task.completed = toggleStatus.isOn
        }
    }
    
    
}
