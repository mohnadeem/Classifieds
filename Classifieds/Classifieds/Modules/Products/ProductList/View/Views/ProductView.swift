//
//  ProductView.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import UIKit
import Kingfisher

class ProductView: AbstractNibView {
    
    // MARK: Properties
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
        
    // MARK: Customise View
    override func customizeView() {
        super.customizeView()
        priceLabel.appStyle(text: "", font: AppFonts.smallBold, textColor: AppColors.black)
        dateLabel.appStyle(text: "", font: AppFonts.xSmall, textColor: AppColors.gray)
        nameLabel.appStyle(text: "", font: AppFonts.smallBold, textColor: AppColors.grayXDark)
    }
    
    /**
     Fill in view with product model
     - parameter product: the product model
     */
    public func fillInfo(product: Product) {
        priceLabel.text = product.price
        nameLabel.text = product.name
        if let date = product.createdAt {
            dateLabel.text = DateHelper.dateToShortDateString(date)  ?? ""
        }
        if let urlString = product.thumbsUrlsList?.first {
            let url = URL(string: urlString)
            DispatchQueue.main.async {
                self.thumbImageView.kf.setImage(with: url)
            }
        }
    }
}
