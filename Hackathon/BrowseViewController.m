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
#import "Prefix.pch"
#import "CollectionViewCell.h"
#import "ProductDetailViewController.h"
#import "HackathonAppManager.h"
@interface BrowseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate> {
    BaseTableView *baseTableView;
    UILabel *headerLabel;
    UILabel *secondHeaderLabel;
}

@end

@implementation BrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, getScreenWidth(), 40)];
    headerLabel.text=@"#Trending";
    [self.view addSubview:headerLabel];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setBackgroundColor:RGBA(243, 241, 243, 1)];

    secondHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 224, getScreenWidth(), 40)];
    secondHeaderLabel.text=@"Best Selling Products";
    [self.view addSubview:secondHeaderLabel];
    secondHeaderLabel.textAlignment = NSTextAlignmentCenter;
    [secondHeaderLabel setBackgroundColor:RGBA(243, 241, 243, 1)];

    
    ProductData *prodData = [[ProductData alloc] init];
    
    [prodData fetchAllDataWithSuccess:^(NSMutableArray *data) {
        baseTableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0,264, getScreenWidth(), getScreenHeight()-264-50) andProductsArray:data];
        self.dataArray=data;
        baseTableView.separatorColor = [UIColor clearColor];
        [self.view addSubview:baseTableView];

    } failure:^(NSError *error) {
        
    }];

    [prodData fetchDataFor:@"Clothing" withSuccess:^(NSMutableArray *data) {
        self.collDataArray=data;
        [self showResponsesCollectionView];
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark UICollectionViewMethods


-(void) showResponsesCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(110, 110);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    
    self.topCollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 104, getScreenWidth(), 120) collectionViewLayout:layout];
    self.topCollView.dataSource=self;
    self.topCollView.delegate=self;
    [self.view addSubview:self.topCollView];
    self.topCollView.backgroundColor=RGBA(244, 245, 244, 1);
    [self.topCollView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    [cell bindDataFor:[self.collDataArray objectAtIndex:indexPath.row]];
    ((CollectionViewCell *)cell).labelForProductInformation.hidden=YES;
    cell.backgroundColor=RGBA(244, 245, 244, 1);
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailViewController *vc = [[ProductDetailViewController alloc] initWithNibName:@"ProductDetailViewController" bundle:nil andProduct:[self.collDataArray objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
