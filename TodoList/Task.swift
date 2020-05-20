//
//  Task.swift
//  TodoList
//
//  Created by Partha Sarathy on 5/18/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit

class Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.taskName == rhs.taskName &&
            lhs.taskCreated == rhs.taskCreated &&
            lhs.completed == rhs.completed
    }
    
    
    var taskName:String
    var completed: Bool
    var taskCreated: Date
    
    init(taskName:String, completed: Bool) {
        self.taskName = taskName
        self.completed = completed
        self.taskCreated = Date()
    }
    
}
