//
//  CollectionViewCell.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/16/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageForProduct;
@property (weak, nonatomic) IBOutlet UIButton *buttonForFavoriteTapped;
@property (strong,nonatomic) Product *product;
@property (weak, nonatomic) IBOutlet UILabel *labelForProductInformation;
- (IBAction)buttonForFavoriteTapped:(id)sender;
-(void)bindDataFor:(Product*)product;

@end
