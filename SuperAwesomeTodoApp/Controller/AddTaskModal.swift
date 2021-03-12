//
//  AddTaskModal.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 01/03/21.
//

import UIKit

class AddTaskModal: UIViewController {

    //Variables
    weak var taskControllerDelegate: TaskControllerDelegate!
    
    //Outlets
    @IBOutlet weak var taskTextField: textField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("modal loaded")
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onCancel(_ sender: RoundedButton) {
        dismiss(animated: true)
    }
    
    @IBAction func onSave(_ sender: RoundedButton) {
        
        
    
        guard let taskName = taskTextField.text, taskName.count > 0 else{
            taskTextField.borderStyle        = .roundedRect
            taskTextField.layer.borderWidth  = 1
            taskTextField.layer.borderColor  = UIColor.red.cgColor
            
            return
        }
        taskTextField.borderStyle       = .none
        taskTextField.layer.borderWidth  = 0
        
        let colorIndex = Int.random(in: 0..<Constants.colorArray.count)
        
        let newTask = TaskModel(name: taskName, date: datePicker.date, color: Constants.colorArray[colorIndex])
        TaskManager.shared.saveTask(task: newTask) { [weak self] (error) in
            guard let self = self else { return }
            switch error{
            case true:
                self.taskControllerDelegate.didSaveTask(task: newTask)
                self.dismiss(animated: true)
            case false:
                let alert = UIAlertController(title: "Oops", message: "Something went wrong", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                    self.dismiss(animated: true)
                }
                
                alert.addAction(alertAction)
                self.present(alert, animated: true)
            }
        }
        
    }
    
    
    
    
}
