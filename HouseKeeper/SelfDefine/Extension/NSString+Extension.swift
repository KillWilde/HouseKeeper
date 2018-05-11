//
//  NSString+Extension.swift
//  HouseKeeper
//
//  Created by Megatron on 10/05/2017.
//  Copyright © 2017 Megatron. All rights reserved.
//

import Foundation

extension NSString{
    class func getCurrentDate() -> (String){
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day,Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second], from: date as Date)
        
        return ("\(components.year!)-\(components.month!)-\(components.day!) \(components.hour!):\(components.minute!):\(components.second!)")
    }
    
    class func getCurrentDateInfo() ->(year:Int,month:Int,day:Int,hour:Int,minute:Int,second:Int){
        var myDate = (year:Int(0),month:Int(0),day:Int(0),hour:Int(0),minute:Int(0),second:Int(0))
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day,Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second], from: date as Date)
        
        myDate.year = components.year!
        myDate.month = components.month!
        myDate.day = components.day!
        myDate.hour = components.hour!
        myDate.minute = components.minute!
        myDate.second = components.second!
       
        return myDate
    }
    
    class func getSqliteTableNameDate() ->(String){
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day,Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second], from: date as Date)
        
        let year : String = "\(components.year!)"
        let month = components.month! >= 10 ? "\(components.month!)" : "0\(components.month!)"
        let day = components.day! >= 10 ? "\(components.day!)" : "0\(components.day!)"
        
        let destName = "\(year)\(month)\(day)"
        
        return destName
    }
}
