//
//  TaskService.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 03/03/21.
//

import Foundation

class TaskManager {
    
    static let shared =  TaskManager()
    
    private var tasks: [TaskModel] = []
    
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
    
    func sortArrayByDate(){
        tasks.sort { (taskModel1, TaskModel2) -> Bool in
            return taskModel1.date < TaskModel2.date
        }
    }
    
    func saveTask(task: TaskModel, completed: @escaping (_ error :Bool)-> Void ){
        tasks.append(task)
        completed(true)
    }
    
    func deleteTask(taskToDelete: TaskModel, completed: @escaping (_ error :Bool)-> Void ){
        self.tasks = tasks.filter { (task) -> Bool in
            return task.ID != taskToDelete.ID
        }
        sortArrayByDate()
        completed(true)
    }
    
    func setCompletedOrUncompleted(index: Int, completed: @escaping (_ task: TaskModel) -> Void){
        tasks[index].completed = !tasks[index].completed
        sortArrayByDate()
        completed(tasks[index])
    }
    
    
    
}
