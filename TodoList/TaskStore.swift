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
    
    func addTask(taskName: String) -> Task{
        let newTask = Task(taskName: taskName, completed: false)
        tasks.insert(newTask, at: 0)
        return newTask
    }
    
    func deleteTask(task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks.remove(at: index)
        }
        
    }
    
}
