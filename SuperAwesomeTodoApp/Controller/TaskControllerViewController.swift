//
//  TaskControllerViewController.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 27/02/21.
//

import UIKit

protocol TaskControllerDelegate:class {
    func didSaveTask(task: TaskModel)
}


class TaskControllerViewController: UIViewController {

    //Variables
    var todaysTasks: [TaskModel]   = []
    var upcomingTasks: [TaskModel] = []
    var colorIndex: Int            = 0
    
    
    //Outlets
    @IBOutlet weak var TasksCollectionView: UICollectionView!
    @IBOutlet weak var TasksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureTableView()
        fetchTodaysTaks()
        fetchUpcomingTaks()
        // Do any additional setup after loading the view.
    }
    
    private func configureCollectionView(){
        TasksCollectionView.delegate = self
        TasksCollectionView.dataSource = self
    }
    
    private func configureTableView(){
        TasksTableView.delegate   = self
        TasksTableView.dataSource = self
    }
    
    private func fetchTodaysTaks(){
        todaysTasks   = TaskManager.shared.fetchTodaysTasks()
        upcomingTasks = TaskManager.shared.fetchTodaysTasks()
    }
    
    private func fetchUpcomingTaks(){
        upcomingTasks = TaskManager.shared.fetchTodaysTasks()
    }
    
    @IBAction func addTaskOnTap(_ sender: UIButton) {
        print("Tapped")
        
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        if let modal = storyboard.instantiateViewController(withIdentifier: "AddTaskModal") as? AddTaskModal {
            modal.modalTransitionStyle   = .crossDissolve
            modal.modalPresentationStyle = .overFullScreen
            modal.taskControllerDelegate = self
            
            self.present(modal, animated: true)
        }
        
    }
    
  
}

extension TaskControllerViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todaysTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TASK_COLLECTION_VIEW_CELL_ID, for: indexPath) as? TaskCollectionCell{
            
            let totalColors = Constants.colorArray.count;
            
            if (indexPath.row % totalColors == 0 && indexPath.row > 0) || totalColors == colorIndex {
                colorIndex = 0
                cell.configure(task: todaysTasks[indexPath.row], colorIndex: colorIndex)
            }else{
                cell.configure(task: todaysTasks[indexPath.row], colorIndex: colorIndex)
            }
            
            colorIndex += 1

            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    
}

extension TaskControllerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingTasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TASK_TABLE_VIEW_CELL_ID, for: indexPath) as? TaskTableCell{
            print(indexPath.row)
            
            
            let totalColors = Constants.colorArray.count;
            
            if (indexPath.row % totalColors == 0 && indexPath.row > 0) || totalColors == colorIndex {
                colorIndex = 0
                cell.configure(task: upcomingTasks[indexPath.row], colorIndex: colorIndex)
               
            }else{
                cell.configure(task: upcomingTasks[indexPath.row], colorIndex: colorIndex)
            }
            
            colorIndex += 1

            return cell
            
            
            
            
        }
        return UITableViewCell()
    }
    
    
}


extension TaskControllerViewController: TaskControllerDelegate{
    func didSaveTask(task: TaskModel) {
        print("task received: \(task)")
    }
    
    
}
