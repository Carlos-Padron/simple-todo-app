//
//  TaskService.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 03/03/21.
//

import Foundation

class TaskManager {
    
    static let shared =  TaskManager()
    
    private var tasks: [TaskModel] = [
        TaskModel(name: "1", date: Date()),
        TaskModel(name: "2", date: Date()),
        TaskModel(name: "3", date: Date()),
        TaskModel(name: "1", date: Date()),
        TaskModel(name: "2", date: Date()),
        TaskModel(name: "3", date: Date()),
        TaskModel(name: "1", date: Date()),
        TaskModel(name: "2", date: Date()),
        TaskModel(name: "3", date: Date()),   TaskModel(name: "1", date: Date()),
        TaskModel(name: "2", date: Date()),
        TaskModel(name: "3", date: Date()),
        TaskModel(name: "1", date: Date()),
        TaskModel(name: "2", date: Date()),
        TaskModel(name: "3", date: Date()),
        TaskModel(name: "1", date: Date()),
        TaskModel(name: "2", date: Date()),
        TaskModel(name: "3", date: Date()),
    ]
    
    
    
    func fetchTodaysTasks()->[TaskModel] {
        return tasks
    }
    
    func fetchOtherTaks() ->[TaskModel]{
        return tasks
    }
    
    func saveTask(task: TaskModel, completed: @escaping (_ error :Bool)-> Void ){
        
    }
    
    func deleteTask(completed: @escaping (_ error :Bool)-> Void ){
        
    }
    
    
    
    
    
    
}
