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
    
    func configure(task: TaskModel, colorIndex: Int){
        taskNameLabel.text        = task.name
        taskNameLabel.textColor   = Constants.colorArray[colorIndex]
        
        dateLabel.text            = task.date.convertToStringWithDateFormat(format: "dd/MM/yyyy")
        dateLabel.textColor       = Constants.colorArray[colorIndex]
        
        calendarImgView.image     = UIImage(systemName: "calendar")
        calendarImgView.tintColor = Constants.colorArray[colorIndex]
    }
    
    
}
