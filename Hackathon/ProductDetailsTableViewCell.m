//
//  ProductDetailsTableViewCell.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "ProductDetailsTableViewCell.h"
@implementation ProductDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bindData:(Product*) product{
    self.titleLabel.text=product.title;
    self.priceLabel.text=[NSString stringWithFormat:@"₹ %@",product.price];
    self.qtyLabel.text=[NSString stringWithFormat:@"%d in stock",product.quantity];
}

@end
