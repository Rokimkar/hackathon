//
//  CollectionViewCell.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/16/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CollectionViewCell.h"
#import "HackathonAppManager.h"
#import "UIImageView+AFNetworking.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)buttonForFavoriteTapped:(id)sender {
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:self.product.prodId]]){
        [[HackathonAppManager sharedInstance]removeItemFromFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
        
    }
    else{
        [[HackathonAppManager sharedInstance]addItemInFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
    }
}


-(void)bindDataFor:(Product*)product{
    self.backgroundColor=[UIColor greenColor];
    self.product=product;
    
    if ([HackathonAppManager sharedInstance].appUserType == kSeller) {
        self.labelForProductInformation.hidden=YES;
    }
    else{
        self.labelForProductInformation.hidden=NO;
    }
    
    self.labelForProductInformation.text=product.type;
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:product.prodId]]){
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:product.img1] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    [self.imageForProduct setImageWithURLRequest:req placeholderImage:[UIImage imageNamed:@"placeHolderImage.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        if (!request) {
            self.imageForProduct.image=image;
            self.imageForProduct.contentMode=UIViewContentModeScaleToFill;
        }
        else{
            
            [UIView transitionWithView:self.imageForProduct duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.imageForProduct.image=image;
                self.imageForProduct.contentMode=UIViewContentModeScaleToFill;
            } completion:^(BOOL finished) {
                
            }];
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    }];
}


@end

