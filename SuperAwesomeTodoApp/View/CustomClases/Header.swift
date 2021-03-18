//
//  Header.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 26/02/21.
//

import UIKit

@IBDesignable class Header: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure(){
        layer.cornerRadius = 40
        layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

}
