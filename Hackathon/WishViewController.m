//
//  WishViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/9/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "WishViewController.h"
#import "BaseTableView.h"
#import "ProductData.h"
#import "AddWishViewController.h"
#import "CollectionViewCell.h"
#define SPACING 10.0
@interface WishViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    BaseTableView *wishTableView;
    CGSize screenSize;
}
@end

@implementation WishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize = ([UIScreen mainScreen]).bounds.size;
    
    ProductData *prodData = [[ProductData alloc] init];
    [prodData fetchDataFor:@"Clothing" withSuccess:^(NSMutableArray *data) {
        
        self.dataArray = data;
        
//        wishTableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-50) andProductsArray:data];
//        [self.view addSubview:wishTableView];
        
    } failure:^(NSError *error) {
        
    }];
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated{
    if (self.topSegmentControl.selectedSegmentIndex==0) {
        self.addNewWishBtn.hidden=NO;
        self.responsesCollectionView.hidden=YES;
        [self showResponsesCollectionView];
    }
    else{
        self.addNewWishBtn.hidden=YES;
        [self showFavTableView];
    }
}
- (IBAction)segmentValChanged:(id)sender {
}
- (IBAction)addNewWishBtn:(id)sender {
    
    AddWishViewController *wishCont = [[AddWishViewController alloc] initWithNibName:@"AddWishViewController" bundle:nil];
    [self.navigationController pushViewController:wishCont animated:YES];
    
}

-(void) showFavTableView{
    
}



#pragma mark UICollectionViewMethods


-(void) showResponsesCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    NSInteger width = (screenSize.width-3*SPACING)*0.5;
    layout.itemSize = CGSizeMake(width, width);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumLineSpacing = width;
    layout.minimumInteritemSpacing = width;
    self.responsesCollectionView.collectionViewLayout=layout;
    [self.responsesCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    
}



-(void) setLayout{
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];

    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSInteger rows = [collectionView numberOfItemsInSection:indexPath.section];
//    if (indexPath.row == rows-1 && imagesArray.count<IMAGES_ALLOWED) {
//        [self startImagePicking];
//    }
    
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
