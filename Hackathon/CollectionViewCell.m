//
//  CollectionViewCell.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/16/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CollectionViewCell.h"
#import "HackathonAppManager.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)buttonForFavoriteTapped:(id)sender {
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:self.product.prodId]]){
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
    }
}


-(void)bindDataFor:(Product*)product{
    
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:product.prodId]]){
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.buttonForFavoriteTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
    }
}


@end

