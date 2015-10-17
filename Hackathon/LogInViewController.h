//
//  LogInViewController.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/17/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController
- (IBAction)buttonForBuyer:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonForBuyer;

@property (weak, nonatomic) IBOutlet UIButton *buttonForSeller;
- (IBAction)buttonForSeller:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UILabel *genericLabel;

@end
