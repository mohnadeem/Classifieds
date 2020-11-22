//
//  ProductDetailTableViewCell.h
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Product;

@interface ProductDetailTableViewCell : UITableViewCell

// MARK: Properties
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@property (strong, nonatomic) UIView *view;

// MARK: Functions
-(void)populateCell:(Product *) product;

@end

NS_ASSUME_NONNULL_END
