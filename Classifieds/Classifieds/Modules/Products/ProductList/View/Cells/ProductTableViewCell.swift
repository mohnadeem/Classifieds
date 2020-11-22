//
//  ProductTableViewCell.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var productView: ProductView!
    
    // MARK: Cell life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    /**
     Populate cell with product
     - parameter product: the product
     */
    public func populateCell(product: Product) {
        productView.fillInfo(product: product)
    }
}
