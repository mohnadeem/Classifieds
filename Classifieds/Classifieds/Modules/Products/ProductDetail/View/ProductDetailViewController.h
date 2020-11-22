//
//  ProductDetailViewController.h
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class Product;

@interface ProductDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Product *product;
@end

NS_ASSUME_NONNULL_END
