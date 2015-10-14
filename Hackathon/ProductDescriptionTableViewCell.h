//
//  ProductDescriptionTableViewCell.h
//  gotg
//
//  Created by Kunal Chelani on 6/24/15.
//  Copyright (c) 2015 til. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductDescriptionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
-(void) bindDataFor :(Product*) product;



@end
