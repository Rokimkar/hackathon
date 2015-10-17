//
//  LogInViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/17/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "LogInViewController.h"
#import "Prefix.pch"
#import "HackathonAppManager.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.buttonForSeller.layer setBorderColor:RGBA(225, 61, 69, 1.0).CGColor];
    [self.buttonForSeller.layer setBorderWidth:2.0];
    [self.buttonForSeller.layer setCornerRadius:5.0];
    
    [self.buttonForBuyer.layer setBorderColor:RGBA(225, 61, 69, 1.0).CGColor];
    [self.buttonForBuyer.layer setBorderWidth:2.0];
    [self.buttonForBuyer.layer setCornerRadius:5.0];
    self.bgImgView.frame=CGRectMake(0, 0, getScreenWidth(), getScreenHeight());
    self.buttonForSeller.frame = CGRectMake((getScreenWidth()-139)*0.5, getScreenHeight()-50, 139, 30);
    self.buttonForBuyer.frame = CGRectMake((getScreenWidth()-139)*0.5, getScreenHeight()-100, 139, 30);
    self.genericLabel.frame = CGRectMake((getScreenWidth()-280)*0.5, getScreenHeight()-150, 280, 30);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buyerBtnPressed:(id)sender {
    [HackathonAppManager sharedInstance].appUserType=kBuyer;
}


- (IBAction)sellerBtnPressed:(id)sender {
        [HackathonAppManager sharedInstance].appUserType=kSeller;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)buttonForBuyer:(id)sender {
}
- (IBAction)buttonForSeller:(id)sender {
}
@end
