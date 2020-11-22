//
//  AppFonts.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import UIKit

struct AppFonts {
    // MARK: fonts names
    private static let fontTextBoldEN = "SFProText-Bold"
    private static let fontTextRegularEN = "SFProText-Regular"
    private static let fontTextRegularItalicEN = "SFProText-RegularItalic"
    private static let fontDisplayBoldEN = "SFProDisplay-Bold"

    // MARK: font sizes
    private static let sizeXXBig:Double = 50
    private static let sizeXBig:Double = 30
    private static let sizeAlertBig:Double = 26
    private static let sizeBig:Double = 20
    private static let sizeNormal:Double = 17
    private static let sizeSmall:Double = 15
    private static let sizeXSmall:Double = 13
    private static let sizeMSmall:Double = 11
    private static let sizeXXSmall:Double = 9
    
    private enum FontWeight {
        case bold
        case regular
        case regularItalic
    }
    
    // MARK: fonts getters
    // font to be used in the app
    static var xXBigBold: UIFont {
        let fontName = getDisplayFontName()
        return UIFont(name: fontName, size: CGFloat(sizeXXBig * fontScale)) ?? UIFont()
    }

    static var xBig: UIFont {
        let fontName = getTextFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale)) ?? UIFont()
    }
    
    static var xBigBold: UIFont {
        let fontName = getDisplayFontName()
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale)) ?? UIFont()
    }
    
    static var alertBigBold: UIFont {
        let fontName = getDisplayFontName()
        return UIFont(name: fontName, size: CGFloat(sizeAlertBig * fontScale)) ?? UIFont()
    }
    
    static var bigBold: UIFont {
        let fontName = getDisplayFontName()
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale)) ?? UIFont()
    }
    
    static var big: UIFont {
        let fontName = getTextFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale)) ?? UIFont()
    }
    
    static var normal: UIFont {
        let fontName = getTextFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale)) ?? UIFont()
    }
    
    static var normalBold: UIFont {
        let fontName = getTextFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale)) ?? UIFont()
    }
    
    static var small: UIFont {
        let fontName = getTextFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale)) ?? UIFont()
    }
    
    static var smallItalic: UIFont {
        let fontName = getTextFontName(weight:.regularItalic)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale)) ?? UIFont()
    }
    
    static var smallBold: UIFont {
        let fontName = getTextFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale)) ?? UIFont()
    }
    
    static var xSmall: UIFont {
        let fontName = getTextFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale)) ?? UIFont()
    }
    
    static var xSmallBold: UIFont {
        let fontName = getTextFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale)) ?? UIFont()
    }
    
    static var mSmall: UIFont {
        let fontName = getTextFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeMSmall * fontScale)) ?? UIFont()
    }
    
    static var mSmallBold: UIFont {
        let fontName = getTextFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeMSmall * fontScale)) ?? UIFont()
    }
    
    static var xXSmall: UIFont {
        let fontName = getTextFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall * fontScale)) ?? UIFont()
    }
    
    static var xXSmallBold: UIFont {
        let fontName = getTextFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall * fontScale)) ?? UIFont()
    }
    
    // Font scale
    private static var fontScale:Double {
        var scale : Double = 1.0;
        if (ScreenSize.isSmallScreen) { // iPhone 4 & 5 (480 - 568)
            scale = 0.8;
        } else if (ScreenSize.isMidScreen){ // iPhone 6 & 7 (667)
            scale = 0.95;
        } else { // iPhone 6+ & 7+ (736)
            scale = 1.0;
        }
        return scale;
    }
    
    private static func getTextFontName(weight: FontWeight) -> String {
        switch weight {
        case .bold:
            return fontTextBoldEN
        case .regular:
            return fontTextRegularEN
        case .regularItalic:
            return fontTextRegularItalicEN
        }
    }
    
    private static func getDisplayFontName() -> String {
        return fontDisplayBoldEN
    }
}


