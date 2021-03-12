//
//  TaskTableCell.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 03/03/21.
//

import UIKit

class TaskTableCell: UITableViewCell {

    var taskLabel  = UILabel()
    var dateLabel  = UILabel()
    var baseView   = UIView()
    var checkImage = UIImageView()
    var leftBorder = CALayer()
    
    @IBOutlet weak var Card: Card!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutUI()
        // Initialization code
    }
    
    
    func configure(task: TaskModel){
        
        print("cell configured")
        
        taskLabel.text = task.name
        dateLabel.text = task.date.convertToStringWithDateFormat(format: "dd/MM/yyyy")
        
        taskLabel.font = UIFont(name: "AvenirNext-Bold", size: 23)
        dateLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
        
        taskLabel.textColor = task.color
        dateLabel.textColor = task.color
        
        taskLabel.lineBreakMode = .byTruncatingTail
        dateLabel.lineBreakMode = .byTruncatingTail
        
        leftBorder.backgroundColor = task.color.cgColor
        
        print(task.completed)
        
        if task.completed {
            checkImage.image = UIImage(systemName: "checkmark.circle")
            checkImage.tintColor = UIColor(red: 0.40, green: 0.83, blue: 0.43, alpha: 1.00)
        }else{
            checkImage.image = nil
        }

        
    }
    
    func layoutUI(){

        baseView.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseView)
        baseView.layer.cornerRadius = 20
        baseView.addSubview(taskLabel)
        baseView.addSubview(dateLabel)
        baseView.addSubview(checkImage)
        
        
        leftBorder.frame =  CGRect(x: 0, y: 0, width: 15, height: Card.bounds.height )
        leftBorder.backgroundColor = UIColor.red.cgColor
        baseView.layer.addSublayer(leftBorder)
        baseView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: Card.topAnchor),
            baseView.bottomAnchor.constraint(equalTo: Card.bottomAnchor),
            baseView.leadingAnchor.constraint(equalTo: Card.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: Card.trailingAnchor),
            
            checkImage.heightAnchor.constraint(equalToConstant: 60),
            checkImage.widthAnchor.constraint(equalToConstant: 60),
            checkImage.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            checkImage.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10),
            
            taskLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            taskLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 35),
            taskLabel.trailingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: -10),
            taskLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: -5),
            
            dateLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 35),
            dateLabel.trailingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10),
        ])
        
        
        
        
    }

}
