//
//  WallViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/9/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "WallViewController.h"
#import "SWRevealViewController.h"
#import "ProductData.h"
#import "BaseTableView.h"
#import "Prefix.pch"


@interface WallViewController (){
    BaseTableView *wallTableView;
}

@end

@implementation WallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ProductData *prodData = [[ProductData alloc] init];
    [prodData fetchWishDataWithSuccess:^(NSMutableArray *data) {
        wallTableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-50) andProductsArray:data];
        wallTableView.separatorColor = [UIColor clearColor];
        wallTableView.backgroundColor=RGBA(244, 245, 244, 1);
        [self.view addSubview:wallTableView];
        
    } failure:^(NSError *error) {
        
    }];
    
   [self navItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) navItems {
    UINavigationItem *navItems = [[UINavigationItem alloc]init];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn setBackgroundImage:[UIImage imageNamed:@"search_image.png"] forState:UIControlStateNormal];
    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"More Filled-32.png"] forState:UIControlStateNormal];
    UIBarButtonItem *moreActions = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"cart.png"] forState:UIControlStateNormal];
    UIBarButtonItem *cart = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    //    navItems.rightBarButtonItems =
    self.navigationItem.rightBarButtonItems=[[NSArray alloc]initWithObjects:searchBtn,cart,moreActions, nil];
    //    return navItems;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sideBarButton:(id)sender {
}
@end
