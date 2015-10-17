//
//  TopZoneCollectionViewCell.m
//  gotg
//
//  Created by Kunal Chelani on 6/20/15.
//  Copyright (c) 2015 til. All rights reserved.
//

#import "TopZoneCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "HackathonAppManager.h"
#import "WishViewController.h"
@implementation TopZoneCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void) bindItemData :(Product*) itemData
{
//    if (itemData.imageUrl)
//        [self bindImageFor:itemData.imageUrl];
//    else
//        [self bindImageFor:itemData.productThumbnail];
    self.mainLabel.text=itemData.type;

//    if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
//        self.mainLabel.hidden=YES;
//    }
//    else{
//        if (self.isWish) {
//            self.mainLabel.hidden=NO;
//        }
//        else{
//                 self.mainLabel.hidden=YES;
//        }
//    }
    self.mainLabel.hidden=YES;
//    self.bgImageView.image = [UIImage imageNamed:@"addIcon"];
}
-(void) bindActualImageFor:(UIImage*) image{
    
    self.bgImageView.image=image;
    
}


-(void) bindImageFor:(NSString*) imageUrl
{
    if (!imageUrl || [imageUrl isEqualToString:@""]) {
        return;
    }
    
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]
                                                  cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                              timeoutInterval:60];
    
    [self.bgImageView setImageWithURLRequest:imageRequest placeholderImage:[UIImage imageNamed:@"placeHolderImage.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [self.bgImageView setContentMode:UIViewContentModeCenter];
        if (!request){ // image was cached
            [self.bgImageView setContentMode:UIViewContentModeScaleAspectFit];
            [self.bgImageView setImage:image];
        }
        else{
            [UIView transitionWithView:self.bgImageView
                              duration:1.0f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                [self.bgImageView setContentMode:UIViewContentModeScaleAspectFit];
                                self.bgImageView.image = image;
                                
                            } completion:NULL];
        }
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
    }];
    
}

- (IBAction)favButtonTapped:(id)sender {
    if([[HackathonAppManager sharedInstance]productExist:[NSNumber numberWithInteger:self.product.prodId]]){
        [[HackathonAppManager sharedInstance]removeItemFromFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
        [self.favButtonTapped setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateNormal];
        [self.favButtonTapped  setBackgroundImage:[UIImage imageNamed:@"unFav.png"] forState:UIControlStateHighlighted];
    }
    else{
        [self.favButtonTapped  setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
        [self.favButtonTapped  setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateHighlighted];
        [[HackathonAppManager sharedInstance]addItemInFavIdsArray:[NSNumber numberWithInteger: self.product.prodId]];
    }
}

@end
