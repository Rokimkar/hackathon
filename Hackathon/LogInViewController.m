//
//  LogInViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/17/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "LogInViewController.h"
#import "Prefix.pch"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.buttonForSeller.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.buttonForSeller.layer setBorderWidth:1.0];
    [self.buttonForSeller.layer setCornerRadius:5.0];
    
    [self.buttonForBuyer.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.buttonForBuyer.layer setBorderWidth:1.0];
    [self.buttonForBuyer.layer setCornerRadius:5.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
