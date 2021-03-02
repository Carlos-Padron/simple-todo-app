//
//  DateExtension.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 28/02/21.
//

import Foundation

extension Date{
    
    func convertToStringWithDateFormat(format: String) -> String{
        let dateFormmatrer         = DateFormatter()
        dateFormmatrer.dateFormat  = format
        
        return dateFormmatrer.string(from: self)
    }
    
    
}
