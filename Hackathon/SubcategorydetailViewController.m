//
//  SubcategorydetailViewController.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "SubcategorydetailViewController.h"
#import "BaseTableView.h"
@interface SubcategorydetailViewController (){
    BaseTableView *tableView;
}

@end

@implementation SubcategorydetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.subCategoryTitle;
    self.subLabel.text = self.subCategoryTitle;
    tableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andProductsArray:nil];
    [self.view addSubview:tableView];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    tableView.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ;
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
