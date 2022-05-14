//
//  IosDateFormatter.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 08/05/22.
//

import Foundation

func changeToDate(from date: String) -> String {
    
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions =  [.withFullDate,.withDashSeparatorInDate]
    let date = formatter.date(from: date)
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    
    dateFormatter.locale = Locale(identifier: "en_US")
    
    let dateString =  dateFormatter.string(from: date ??  Date()) // Jan 2, 2001
    
    let index = dateString.firstIndex(of: ",") ?? dateString.endIndex
    let finalDate = dateString[..<index]
    
    
    return String(finalDate)
}
