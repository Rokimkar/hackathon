//
//  TableViewCell.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/13/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "TableViewCell.h"
#import "HackathonAppManager.h"
#import "UIImageView+AFNetworking.h"
@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonForFavoriteTapped:(id)sender {
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:self.product.prodId]]){
        [[HackathonAppManager sharedInstance]removeItemFromFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_unselected.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_unselected.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_selected.jpeg"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_selected.jpeg"] forState:UIControlStateHighlighted];
        [[HackathonAppManager sharedInstance]addItemInFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
    }
}

-(void) bindDataFor:(Product*) product{
    
    self.descriptionLabel.text=product.title;
    self.descriptionLabel.numberOfLines=0;
//    self.descriptionLabel.sizeToFit;
    self.priceLabel.text=product.price;
    self.product=product;
    
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:self.product.prodId]]){
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_selected.jpeg"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_selected.jpeg"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_unselected.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"favorite_unselected.png"] forState:UIControlStateHighlighted];
    }

    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:product.img1] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    [self.imageViewForProduct setImageWithURLRequest:req placeholderImage:[UIImage imageNamed:@""] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        if (!request) {
            self.imageViewForProduct.image=image;
            self.imageViewForProduct.contentMode=UIViewContentModeScaleAspectFit;
        }
        else{
            
            [UIView transitionWithView:self.imageViewForProduct duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.imageViewForProduct.image=image;
                self.imageViewForProduct.contentMode=UIViewContentModeScaleAspectFit;
            } completion:^(BOOL finished) {
                
            }];
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    }];
}

@end
