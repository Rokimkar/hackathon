//
//  TableViewCell.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/13/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewForProduct;
- (IBAction)buttonForFavoriteTapped:(id)sender;
-(void) bindDataFor:(Product*) product;
@property (weak, nonatomic) IBOutlet UIButton *buttonForFavoriteTapped;


@end
