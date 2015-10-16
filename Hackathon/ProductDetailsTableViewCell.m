//
//  ProductDetailsTableViewCell.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "ProductDetailsTableViewCell.h"
#import "WallViewController.h"
#import "WishViewController.h"
#import "HackathonAppManager.h"
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
    if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
        if (self.isWish) {
            if (product.upperPrice && ![product.upperPrice isEqualToString:@""]) {
                self.priceLabel.text=[NSString stringWithFormat:@"₹ %@ to ₹ %@",product.price,product.upperPrice];
            }
            else{
                float upperRange = [product.price floatValue]+1000;
                self.priceLabel.text=[NSString stringWithFormat:@"₹ %@ to ₹ %0.0f",product.price,upperRange];
            }
            self.qtyLabel.text=[NSString stringWithFormat:@"%d needed",product.quantity];
        }
        else{
            self.priceLabel.text=[NSString stringWithFormat:@"₹ %@",product.price];
            self.qtyLabel.text=[NSString stringWithFormat:@"%d in stock",product.quantity];
        }
    }
    else{
        self.priceLabel.text=[NSString stringWithFormat:@"₹ %@",product.price];
        self.qtyLabel.text=[NSString stringWithFormat:@"%d in stock",product.quantity];
    }
}

- (UIViewController *)getViewController {
    UIResponder *nextResponderView = [self nextResponder];
    while (![nextResponderView isKindOfClass:[WishViewController class]] || ![nextResponderView isKindOfClass:[WallViewController class]]) {
        nextResponderView = [nextResponderView nextResponder];
        if (nil == nextResponderView) {
            break;
        }
    }
    return (UIViewController *)nextResponderView;
}


@end
