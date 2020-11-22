//
//  DateHelper.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import UIKit

// MARK: Date helper

struct DateHelper {
    
    /**
     Get date object from iso string
     - parameter dateString: the iso string
     - returns: the date object
     */
    static func getDateFromISOString(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.init(identifier: "en")
        return dateFormatter.date(from: dateString)
    }
    
    /**
     Get iso string from date
     - parameter date: the date object
     - returns: the date iso string
     */
    static func getISOStringFromDate(_ date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        // else we'll get error in parsing from server, if locale is different
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.init(identifier: "en")
        return dateFormatter.string(from: date)
    }
    
    /**
     Convert date to short date string
     - parameter date: the date object
     - returns: the short date string
     */
    static func dateToShortDateString(_ date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = AppConfig.timeZone
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
}
