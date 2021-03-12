//
//  TaskCollectionCell.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 26/02/21.
//

import UIKit

class TaskCollectionCell: UICollectionViewCell {

    @IBOutlet weak var card: Card!
    @IBOutlet weak var calendarImgView: UIImageView!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(task: TaskModel){
        taskNameLabel.text        = task.name
        taskNameLabel.textColor   = task.color
        
        dateLabel.text            = task.date.convertToStringWithDateFormat(format: "dd/MM/yyyy")
        dateLabel.textColor       = task.color
        
        calendarImgView.image     = UIImage(systemName: "calendar")
        calendarImgView.tintColor = task.color
    }
    
    
}
