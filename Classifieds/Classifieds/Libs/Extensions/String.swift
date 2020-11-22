//
//  String.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import Foundation

import UIKit

extension String {

    /// Localized current string key
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
