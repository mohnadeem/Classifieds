//
//  UINavigationBar.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    static let navBorderTag: Int = -999
    
    /// Set navigation bar bottom border
    func setBottomBorderColor(color: UIColor) {
        let lineFrame = CGRect(x: 0, y: frame.size.height - 0.5, width: frame.size.width, height: 0.5)
        let navigationSeparator = UIView(frame: lineFrame)
        navigationSeparator.backgroundColor = color
        navigationSeparator.isOpaque = true
        navigationSeparator.tag = UINavigationBar.navBorderTag
        while let oldView = self.viewWithTag(UINavigationBar.navBorderTag) {
            oldView.removeFromSuperview()
        }
        self.addSubview(navigationSeparator)
    }
}

extension UINavigationController {
    
    /// SwifterSwift: Pop ViewController with completion handler.
    ///
    /// - Parameters:
    ///   - animated: Set this value to true to animate the transition (default is true).
    ///   - completion: optional completion handler (default is nil).
    public func popViewController(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}
