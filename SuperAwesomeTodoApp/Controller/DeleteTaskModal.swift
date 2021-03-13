//
//  DeleteTaskModal.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 13/03/21.
//

import UIKit

class DeleteTaskModal: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
    }
    
}
