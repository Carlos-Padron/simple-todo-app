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
    var leftBorder = CALayer()
    @IBOutlet weak var Card: Card!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(task: TaskModel){
        
        taskLabel.text = task.name
        dateLabel.text = task.date.convertToStringWithDateFormat(format: "dd/MM/yyyy")
        
        
//        let leftBorder = CALayer()
//        leftBorder.frame =  CGRect(x: 0, y: 0, width: 15, height: self.bounds.height )
//        leftBorder.backgroundColor = UIColor.red.cgColor
//        Card.layer.addSublayer(leftBorder)
//        Card.clipsToBounds = true
//        
//        Card.layer.cornerRadius = 20
//        Card.layer.shadowColor   = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
//        Card.layer.shadowRadius  = 5
//        Card.layer.shadowOpacity = 1
    }
    
    func layoutUI(){

        baseView.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        taskLabel.font = UIFont(name: "Avenir-Next-Bold", size: 25)
        dateLabel.font = UIFont(name: "Avenir-Next-Medium", size: 20)
        
        addSubview(baseView)
        
        
        baseView.layer.cornerRadius = 20
        baseView.addSubview(taskLabel)
        baseView.addSubview(dateLabel)
        
        
        leftBorder.frame =  CGRect(x: 0, y: 0, width: 15, height: self.bounds.height )
        leftBorder.backgroundColor = UIColor.red.cgColor
        baseView.layer.addSublayer(leftBorder)
        baseView.clipsToBounds = true
        
        
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: Card.topAnchor),
            baseView.bottomAnchor.constraint(equalTo: Card.bottomAnchor),
            baseView.leadingAnchor.constraint(equalTo: Card.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: Card.trailingAnchor),
            
            taskLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 5),
            taskLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 35),
            taskLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10),
            taskLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: -5),
            
            dateLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 35),
            dateLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10),
        ])
        
        
        
        
    }

}
