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

    if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
        self.mainLabel.hidden=YES;
    }
    else{
        WishViewController *vc = (WishViewController*)[self getViewController];
        if (vc) {
            self.mainLabel.hidden=NO;
        }
        else{
                 self.mainLabel.hidden=YES;
        }
    }
    
//    self.bgImageView.image = [UIImage imageNamed:@"addIcon"];
}

-(void) bindImageFor:(NSString*) imageUrl
{
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]
                                                  cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                              timeoutInterval:60];
    
    [self.bgImageView setImageWithURLRequest:imageRequest placeholderImage:[UIImage imageNamed:@"cardLayout.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [self.bgImageView setContentMode:UIViewContentModeScaleAspectFit];
        if (!request) // image was cached
            [self.bgImageView setImage:image];
        else
            [UIView transitionWithView:self.bgImageView
                              duration:1.0f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                self.bgImageView.image = image;
                                
                            } completion:NULL];
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
    }];
    
}

- (UIViewController *)getViewController {
    UIResponder *nextResponderView = [self nextResponder];
    while (![nextResponderView isKindOfClass:[WishViewController class]]) {
        nextResponderView = [nextResponderView nextResponder];
        if (nil == nextResponderView) {
            break;
        }
    }
    return (UIViewController *)nextResponderView;
}

@end
