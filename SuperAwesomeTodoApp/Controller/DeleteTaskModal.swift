//
//  DeleteTaskModal.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 13/03/21.
//

import UIKit

class DeleteTaskModal: UIViewController {

    var task: TaskModel!
    var taskType: TaskType!
    var taskIndex: IndexPath!
    weak var delegate: TaskControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(taskType.rawValue)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        print("task deleted")
        
        TaskManager.shared.deleteTask(taskToDelete: task) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case true:
                self.delegate.didDeleteTask(taskIndexPath: self.taskIndex, taskType: self.taskType)
                self.dismiss(animated: true)
            case false:
                let alert = UIAlertController(title: "Oopss", message: "Something went wrong", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                    self.dismiss(animated: true)
                }
                alert.addAction(action)
                
                self.present(alert, animated: true)
                
            }
        }
    }
    
}
