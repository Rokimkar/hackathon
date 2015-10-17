//
//  SubcategorydetailViewController.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "SubcategorydetailViewController.h"
#import "BaseTableView.h"
#import "Prefix.pch"
@interface SubcategorydetailViewController (){
    BaseTableView *tableView;
    CGSize screenSize;
}

@end

@implementation SubcategorydetailViewController


-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andDataArray:(NSMutableArray*)dataArray{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataArray = dataArray;
        screenSize = [UIScreen mainScreen].bounds.size;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.subCategoryTitle;
    self.subLabel.text = self.subCategoryTitle;
    tableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height-100) andProductsArray:self.dataArray];
    tableView.separatorColor = [UIColor clearColor];
    tableView.backgroundColor = RGBA(244, 245, 244, 1);
    [self.view addSubview:tableView];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    tableView.frame =CGRectMake(0, 0, screenSize.width, screenSize.height-100);
}

@end
