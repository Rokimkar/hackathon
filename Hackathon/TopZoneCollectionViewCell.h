//
//  TopZoneCollectionViewCell.h
//  gotg
//
//  Created by Kunal Chelani on 6/20/15.
//  Copyright (c) 2015 til. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface TopZoneCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

-(void) bindItemData :(Product*) itemData;


@end
