//
//  TaskController.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 26/02/21.
//

import Foundation

class TaskController {
    
     var taskArray: [TaskModel] = []
    
    
    func update(index: Int, name: String, date: Date){
        taskArray[index].name = name
        taskArray[index].date = date
        
    }
    
    func save(task: TaskModel){
        self.taskArray.append(task)
    }
    
    func delete(uuid: String){
        taskArray = taskArray.filter{$0.ID != uuid}
        
    }
    
    func setCompleted(index: Int){
        taskArray[index].completed = true
    }
    
    func fetchTask() -> [TaskModel]{
        return self.taskArray
    }
    
    
    
    
    
}
