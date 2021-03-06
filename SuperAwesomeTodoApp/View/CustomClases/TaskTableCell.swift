//
//  TaskTableCell.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 03/03/21.
//

import UIKit

class TaskTableCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(task: TaskModel){
        
        taskLabel.text = task.name
        dateLabel.text = task.date.convertToStringWithDateFormat(format: "dd/MM/yyyy")
        
        
        let leftBorder = CALayer()
        leftBorder.frame =  CGRect(x: 0, y: self.frame.size.height, width: 7, height: self.frame.size.height)
        leftBorder.backgroundColor = UIColor.red.cgColor
        self.layer.addSublayer(leftBorder)
        
        layer.cornerRadius = 20
        layer.shadowColor   = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        layer.shadowRadius  = 5
        layer.shadowOpacity = 1
    }

}
