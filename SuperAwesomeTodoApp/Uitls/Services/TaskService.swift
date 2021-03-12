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
//        TaskModel(name: "Code in Swift", date: Date()),
//        TaskModel(name: "Feed Yui", date: Date()),
//        TaskModel(name: "Wash the dishes", date: Date()),
//        TaskModel(name: "Study algorithms", date: Date()),
//        TaskModel(name: "Do exercise", date: Date()),
//        TaskModel(name: "Clean Yui's litter", date: Date()),
//        TaskModel(name: "Learn node", date: Date()),
//        TaskModel(name: "Finish the node js project", date: Date()),
//        TaskModel(name: "Buy Berr", date: Date()),
//        TaskModel(name: "Code in Swift", date: Date()),
//        TaskModel(name: "Feed Yui", date: Date()),
//        TaskModel(name: "Wash the dishes", date: Date()),
//        TaskModel(name: "Study algorithms", date: Date()),
//        TaskModel(name: "Do exercise", date: Date()),
//        TaskModel(name: "Clean Yui's litter", date: Date()),
//        TaskModel(name: "Learn node", date: Date()),
//        TaskModel(name: "Finish the node js project", date: Date()),
//        TaskModel(name: "Buy Beer", date: Date()),
//        TaskModel(name: "Code in Swift", date: Date()),
//        TaskModel(name: "Feed Yui", date: Date()),
//        TaskModel(name: "Wash the dishes", date: Date()),
//        TaskModel(name: "Study algorithms", date: Date()),
//        TaskModel(name: "Do exercise", date: Date()),
//        TaskModel(name: "Clean Yui's litter", date: Date()),
//        TaskModel(name: "Learn node", date: Date()),
//        TaskModel(name: "Finish the node js project", date: Date()),
//        TaskModel(name: "Buy Beer", date: Date()),

    ]
    
    
    
    func fetchTodaysTasks()->[TaskModel] {
        
        let todayTasks = tasks.filter { (TaskModel) -> Bool in
            return TaskModel.date.convertToStringWithDateFormat(format: "dd/MM/yyyy") == Date().convertToStringWithDateFormat(format: "dd/MM/yyyy")
        }
        
        return todayTasks
    }
    
    func fetchOtherTaks() ->[TaskModel]{
        let todayTasks = tasks.filter { (TaskModel) -> Bool in
            return TaskModel.date.convertToStringWithDateFormat(format: "dd/MM/yyyy") != Date().convertToStringWithDateFormat(format: "dd/MM/yyyy")
        }
        
        return todayTasks
    }
    
    func saveTask(task: TaskModel, completed: @escaping (_ error :Bool)-> Void ){
        tasks.append(task)
        completed(true)
    }
    
    func deleteTask(completed: @escaping (_ error :Bool)-> Void ){
        
    }
    
    func setCompletedOrUncompleted(index: Int, completed: @escaping (_ task: TaskModel) -> Void){
        tasks[index].completed = !tasks[index].completed
        completed(tasks[index])
    }
    
    
    
}
