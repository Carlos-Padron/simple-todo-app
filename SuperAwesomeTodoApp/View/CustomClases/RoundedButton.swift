//
//  RoundedButton.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 01/03/21.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {

    @IBInspectable var cornerRaduis: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRaduis
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
