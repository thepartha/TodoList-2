//
//  TaskStore.swift
//  TodoList
//
//  Created by Partha Sarathy on 5/18/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit

class TaskStore {
    
    var tasks: [Task] = []
    
    init() {
        for i in 1...21 {
            tasks.append(Task(taskName: "Task \(i)", completed: false))
        }
    }
    
    func addTask(taskName: String){
        tasks.append(Task(taskName: taskName, completed: false))
    }
    
}
