//
//  MainTaskCard.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 26/02/21.
//

import UIKit

@IBDesignable class Card: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    
    
    func configure(){
        layer.cornerRadius = 20
        layer.shadowColor   = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        layer.shadowRadius  = 5
        layer.shadowOpacity = 1
        
    }
    
    
    
}
