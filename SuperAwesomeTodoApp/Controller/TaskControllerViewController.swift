//
//  TaskControllerViewController.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 27/02/21.
//

import UIKit

protocol TaskControllerDelegate:class {
    func didSaveTask(task: TaskModel)
    func didDeleteTask(taskIndexPath: IndexPath, taskType: TaskType)
}


class TaskControllerViewController: UIViewController, UIGestureRecognizerDelegate {

    //Variables
    var todaysTasks: [TaskModel]   = []
    var upcomingTasks: [TaskModel] = []
    var colorIndex: Int            = 0
    let containerView              = UIView()
    let titleMsg                   = UILabel(frame: .zero)
    
    //Outlets
    @IBOutlet weak var TasksCollectionView: UICollectionView!
    @IBOutlet weak var TasksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureTableView()
        fetchTodaysTaks()
        fetchUpcomingTaks()
    }
    
    private func configureCollectionView(){
        TasksCollectionView.delegate = self
        TasksCollectionView.dataSource = self
        
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(didSelectCollectionCellWithLongPressed(sender:)  ))
        longTapGesture.delegate = self
        
        self.TasksCollectionView.addGestureRecognizer(longTapGesture)
    }
    
    
    
    private func configureTableView(){
        TasksTableView.delegate   = self
        TasksTableView.dataSource = self
        
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(didSelectTableCellWithLongPressed(sender:)))
        longTapGesture.delegate = self
        self.TasksTableView.addGestureRecognizer(longTapGesture)
    }
    
    private func fetchTodaysTaks(){
        todaysTasks   = TaskManager.shared.fetchTodaysTasks()
        upcomingTasks = TaskManager.shared.fetchTodaysTasks()
    }
    
    private func fetchUpcomingTaks(){
        upcomingTasks = TaskManager.shared.fetchTodaysTasks()
    }
    
    @IBAction func addTaskOnTap(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        if let modal = storyboard.instantiateViewController(withIdentifier: "AddTaskModal") as? AddTaskModal {
            modal.modalTransitionStyle   = .crossDissolve
            modal.modalPresentationStyle = .overFullScreen
            modal.taskControllerDelegate = self
            
            self.present(modal, animated: true)
        }
        
    }
    
  
}

// MARK: TaskCollectionView
extension TaskControllerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if todaysTasks.isEmpty {
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: TasksCollectionView.bounds.size.width, height: TasksCollectionView.bounds.size.height))
            noDataLabel.text          = "No data available"
            noDataLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
            noDataLabel.numberOfLines = 3
            noDataLabel.text = "No tasks for today. Enjoy your day off 🎉"
            noDataLabel.textAlignment = .center
            noDataLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    
            TasksCollectionView.backgroundView  = noDataLabel
        }else{
            TasksCollectionView.backgroundView  = nil
        }
        return todaysTasks.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TASK_COLLECTION_VIEW_CELL_ID, for: indexPath) as? TaskCollectionCell{
            cell.configure(task: todaysTasks[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        TaskManager.shared.setCompletedOrUncompleted(index: indexPath.row){ [weak self] task in
            guard let self =  self else{ return }
            self.todaysTasks[indexPath.row] = task
            collectionView.reloadItems(at: [indexPath])
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        TaskManager.shared.setCompletedOrUncompleted(index: indexPath.row){ [weak self] task in
            guard let self =  self else{ return }
            self.todaysTasks[indexPath.row] = task
            collectionView.reloadItems(at: [indexPath])
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 187, height: 240)
    }
    
    
    @objc func didSelectCollectionCellWithLongPressed(sender: UILongPressGestureRecognizer){

        if sender.state == UIGestureRecognizer.State.began {
            let touchPoint = sender.location(in: TasksCollectionView)
            if let indexPath = self.TasksCollectionView.indexPathForItem(at: touchPoint) {
                
                let selectedTask = self.todaysTasks[indexPath.row]
                let storyboard =  UIStoryboard(name: "Modal", bundle: nil)
                
                if let deleteTaskModal = storyboard.instantiateViewController(identifier: "DeleteTaskModal") as? DeleteTaskModal{
                    
                    deleteTaskModal.modalTransitionStyle = .crossDissolve
                    deleteTaskModal.modalPresentationStyle = .overFullScreen
                    deleteTaskModal.task = selectedTask
                    deleteTaskModal.taskIndex = indexPath
                    deleteTaskModal.taskType = TaskType.Today
                    deleteTaskModal.delegate = self
                    
                    present(deleteTaskModal, animated: true)
                }
            }
        }
    }
    
}

// MARK: TaskTableView
extension TaskControllerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if upcomingTasks.isEmpty {
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: TasksTableView.bounds.size.width, height: TasksTableView.bounds.size.height))
                noDataLabel.text          = "No data available"
                noDataLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
                noDataLabel.numberOfLines = 3
                noDataLabel.text = "No pending tasks. Please add some tasks ☺️"
                noDataLabel.textAlignment = .center
                noDataLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    
                TasksTableView.backgroundView  = noDataLabel
        }else{
            TasksTableView.backgroundView  = nil
        }
        
        return upcomingTasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TASK_TABLE_VIEW_CELL_ID, for: indexPath) as? TaskTableCell{
            cell.configure(task: upcomingTasks[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TaskManager.shared.setCompletedOrUncompleted(index: indexPath.row){ [weak self] task in
            guard let self =  self else{ return }
            self.upcomingTasks[indexPath.row] = task
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        TaskManager.shared.setCompletedOrUncompleted(index: indexPath.row){ [weak self] task in
            guard let self =  self else{ return }
            self.upcomingTasks[indexPath.row] = task
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    @objc func didSelectTableCellWithLongPressed(sender: UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizer.State.began {
            let touchePoint = sender.location(in: self.TasksTableView)
            
            if let indexPath = self.TasksTableView.indexPathForRow(at: touchePoint) {
                
                let selectedTask = self.upcomingTasks[indexPath.row]
                let storyboard = UIStoryboard(name: "Modal", bundle: nil)
                
                if let deleteTaskModal = storyboard.instantiateViewController(identifier: "DeleteTaskModal") as? DeleteTaskModal{
                    
                    deleteTaskModal.modalTransitionStyle = .crossDissolve
                    deleteTaskModal.modalPresentationStyle = .overFullScreen
                    deleteTaskModal.task = selectedTask
                    deleteTaskModal.taskIndex = indexPath
                    deleteTaskModal.taskType = TaskType.Upcoming
                    deleteTaskModal.delegate = self
                    
                    present(deleteTaskModal, animated: true)
                }
            }
        }
    }
    
}


extension TaskControllerViewController: TaskControllerDelegate{
    
    func didSaveTask(task: TaskModel) {
        let taskDate = task.date.convertToStringWithDateFormat(format: "dd/MM/yyyy")
        let currentDate =  Date().convertToStringWithDateFormat(format: "dd/MM/yyyy")
        
        if taskDate == currentDate {
            todaysTasks.append(task)
            self.TasksCollectionView.reloadData()
        }else{
            upcomingTasks.append(task)
            self.TasksTableView.reloadData()
        }
    }
    
    func didDeleteTask(taskIndexPath: IndexPath, taskType: TaskType) {
        switch taskType {
        case .Today:
            self.todaysTasks.remove(at: taskIndexPath.row)
            self.TasksCollectionView.deleteItems(at: [taskIndexPath])
        default:
            self.upcomingTasks.remove(at: taskIndexPath.row)
            self.TasksTableView.deleteRows(at: [taskIndexPath], with: .fade)
        }
    }
    
    
    
    
    
    
}
