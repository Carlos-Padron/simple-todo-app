//
//  TaskModel.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 26/02/21.
//

import UIKit

class TaskModel {
    var ID: String
    var name: String
    var date: Date
    var completed: Bool
    var color: UIColor
    
    init(name: String, date: Date, color: UIColor) {
        self.ID        = UUID().uuidString
        self.name      = name
        self.date      = date
        self.completed = false
        self.color     = color
    }
}
