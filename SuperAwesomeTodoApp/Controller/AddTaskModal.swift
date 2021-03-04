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
        
        let newTask = TaskModel(name: taskName, date: datePicker.date)
        print(newTask)
        taskControllerDelegate.didSaveTask(task: newTask)
        dismiss(animated: true)
    }
    
    
    
    
}
