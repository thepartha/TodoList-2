//
//  TaskDetailViewController.swift
//  TodoList
//
//  Created by partha on 5/19/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate{
    
    var task: Task?
    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskStatus: UILabel!
    @IBOutlet var toggleStatus: UISwitch!
    @IBOutlet var taskNotes: UITextView!
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let taskNameText = task?.taskName, let taskStatusV = task?.completed {
            taskName.text = taskNameText
            taskStatus.text = taskStatusV ? "Completed" : "Pending"
        }
        
    }
}
