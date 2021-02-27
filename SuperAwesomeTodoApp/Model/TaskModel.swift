//
//  TaskModel.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 26/02/21.
//

import Foundation

class TaskModel {
    var ID: String
    var name: String
    var date: Date
    var completed: Bool
    
    init(name: String, date: Date) {
        self.ID        = UUID().uuidString
        self.name      = name
        self.date      = date
        self.completed = false
    }
}
