//
//  ProductDetailViewController.m
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

#import "ProductDetailViewController.h"
#import "ProductDetailTableViewCell.h"
#import "Classifieds-Swift.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView setTableFooterView:[[UIView alloc]init]];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProductDetailTableViewCell"];
    // set page title
    [self.navigationItem setTitle:NSLocalizedString(@"PRODUCT_DETAIL_TITLE", @"")];
    [self.navigationItem.backBarButtonItem setAccessibilityIdentifier:@"Back"];
}

- (void)dealloc
{
    printf("ProductDetailViewController was de-initialized");
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *identifier = @"ProductDetailTableViewCell";
    ProductDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell populateCell:self.product];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
