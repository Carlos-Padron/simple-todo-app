//
//  textField.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 02/03/21.
//

import UIKit

@IBDesignable class textField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure(){
        layer.cornerRadius    = 15
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
    
        layer.shadowColor   = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        layer.shadowRadius  = 5
        layer.shadowOpacity = 1
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
        leftViewMode  = .always
        rightViewMode = .always
        leftView = padding
        rightView = padding
        
        
    }

}
