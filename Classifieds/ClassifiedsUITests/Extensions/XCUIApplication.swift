//
//  XCUIApplication.swift
//  ClassifiedsUITests
//
//  Created by Muhammad Nadeem on 22/11/2020.
//

import XCTest

extension XCUIApplication {
    
    /// Is displaying home
    var isDisplayingHome: Bool {
        return otherElements["homeView"].exists
    }
    
    /// Check if app is running
    var isRunning: Bool {
        if self.state == .runningForeground {
            return true
        }
        return false
    }
}
