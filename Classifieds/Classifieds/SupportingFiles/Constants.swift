//
//  Constants.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import Foundation
import UIKit

// MARK: Application configuration

struct AppConfig {

    /// Application Base URL
    static var appBaseURL = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    // Time Zone
    static let timeZone = TimeZone(abbreviation: "GST")

}

// MARK: Screen size
enum ScreenSize {
    static let isSmallScreen =  UIScreen.main.bounds.height <= 568 // iphone 4/5
    static let isMidScreen =  UIScreen.main.bounds.height <= 667 // iPhone 6 & 7
    static let isBigScreen =  UIScreen.main.bounds.height >= 736 // iphone 6Plus/7Plus
    static let isXBigScreen =  UIScreen.main.bounds.height >= 812 // iphone X
    static let isXMaxBigScreen =  UIScreen.main.bounds.height >= 896 // iphone X Max
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
    static let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static var hasNotch: Bool {
        return isXBigScreen || isXMaxBigScreen
    }
}
