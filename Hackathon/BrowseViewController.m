//
//  BrowseViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/9/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BrowseViewController.h"
#import "ProductData.h"
#import "BaseTableView.h"
@interface BrowseViewController (){
    BaseTableView *baseTableView;
}

@end

@implementation BrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ProductData *prodData = [[ProductData alloc] init];
    [prodData fetchDataFor:@"Clothing" withSuccess:^(NSMutableArray *data) {
        baseTableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0,194, self.view.frame.size.width, self.view.frame.size.height-50) andProductsArray:data];
        [self.view addSubview:baseTableView];
        
    } failure:^(NSError *error) {
        
    }];
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

@end
