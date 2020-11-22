//
//  ProductDetailTableViewCell.m
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

#import "ProductDetailTableViewCell.h"
#import "Classifieds-Swift.h"
#import "Kingfisher-Swift.h"

@implementation ProductDetailTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self nibSetup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 Populate cell with product
 - parameter product: the product
 */
-(void)populateCell:(Product *) product {
    
    [self.priceLabel setText: product.price];
    [self.nameLabel setText: product.name];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:product.createdAt];
    [self.dateLabel setText:dateString];

    // image url
    NSString *imageURL = product.imageUrlsList.firstObject;
    NSURL *url = [NSURL URLWithString:imageURL];
    [self.loader startAnimating];
    
    // downloading the image from url
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
     downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        // 3
        UIImage *downloadedImage = [UIImage imageWithData:
        [NSData dataWithContentsOfURL:location]];

        //5
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.detailImageView setImage:downloadedImage];
            [self.loader stopAnimating];
        });
    }];

    // 4
    [downloadPhotoTask resume];
}

-(void)nibSetup {
    self.backgroundColor = [UIColor clearColor];
    self.view = [self loadViewFromNib];
    self.view.frame = [self bounds];
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    self.view.translatesAutoresizingMaskIntoConstraints = true;
    [self addSubview:self.view];
}

-(UIView *)loadViewFromNib {
    NSBundle *bundle = [NSBundle mainBundle];
    UINib *nib = [UINib nibWithNibName:[NSString self] bundle:bundle];
    UIView *nibView = [nib instantiateWithOwner:self options:nil].firstObject;
    return nibView;
}


@end
