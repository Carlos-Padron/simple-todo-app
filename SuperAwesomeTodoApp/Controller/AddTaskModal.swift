//
//  AddTaskModal.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 01/03/21.
//

import UIKit

class AddTaskModal: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("modal loaded")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onCancel(_ sender: RoundedButton) {
        dismiss(animated: true)
    }
    

}
