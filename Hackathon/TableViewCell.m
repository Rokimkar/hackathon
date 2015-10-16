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
#import "Prefix.pch"
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
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
        [[HackathonAppManager sharedInstance]addItemInFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
    }
}

-(void) bindDataFor:(Product*) product{
    self.backgroundColor=RGBA(244, 245, 244, 1);
    self.descriptionLabel.text=product.title;
    self.descriptionLabel.numberOfLines=0;
    self.descriptionLabel.sizeToFit;
    self.priceLabel.text=[NSString stringWithFormat:@"₹ %@",product.price];
    self.priceLabel.textColor=RGBA(192, 56, 64, 1);
    self.product=product;
    self.sellerLabel.text=product.seller;
    
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:self.product.prodId]]){
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
    }

    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:product.img1] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    [self.imageViewForProduct setImageWithURLRequest:req placeholderImage:[UIImage imageNamed:@"placeHolderImage.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
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
