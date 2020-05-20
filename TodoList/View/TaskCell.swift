//
//  TaskCell.swift
//  TodoList
//
//  Created by Partha Sarathy on 5/18/20.
//  Copyright © 2020 partha. All rights reserved.
//

import UIKit

protocol TaskCellDelegate: AnyObject {
    func btnTaskTapped(cell: TaskCell)
}


class TaskCell: UITableViewCell {
    
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskStatus: UILabel!
    
    @IBOutlet var radioButton: UIButton!
    weak var delegate: TaskCellDelegate?
    
    @IBAction func checkTask(_ sender: UIButton) {
        delegate?.btnTaskTapped(cell: self)
    }
    
}
