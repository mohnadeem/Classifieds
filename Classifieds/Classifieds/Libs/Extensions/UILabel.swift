//
//  UILabel.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import Foundation
import UIKit

@objc
extension UILabel {
    
    /// Customize label style with background and text colors
    @objc func appStyle(text: String, font: UIFont, textColor: UIColor = AppColors.white, bgColor: UIColor = UIColor.clear) {
        if bgColor != .clear {
            self.layer.cornerRadius = self.frame.height / 2
            self.layer.masksToBounds = true
        }
        self.text = text
        self.font = font
        self.textColor = textColor
        self.backgroundColor = bgColor
    }
}
