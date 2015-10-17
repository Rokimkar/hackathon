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
-(void) bindImageFor:(NSString*) imageUrl;
-(void) bindActualImageFor:(UIImage*) image;

@property (weak, nonatomic) IBOutlet UIButton *favButtonTapped;
@property (strong, nonatomic) Product *product;

- (IBAction)favButtonTapped:(id)sender;
@property (assign, nonatomic) BOOL isWish;
@end
