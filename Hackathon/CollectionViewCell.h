//
//  CollectionViewCell.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/16/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageForProduct;
@property (weak, nonatomic) IBOutlet UIButton *buttonForFavoriteTapped;
- (IBAction)buttonForFavoriteTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelForProductInformation;

@end
