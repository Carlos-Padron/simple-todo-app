//
//  StringExtension.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 28/02/21.
//

import Foundation

extension String{
    
    func convertToDateWithDateFormat(dateFormat: String) -> Date? {
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone   = TimeZone.current
        dateFormatter.locale     = Locale.current
        
        return dateFormatter.date(from: "2015-04-01T11:42:00") // replace Date String
    }

}
