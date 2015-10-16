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
#import "Prefix.pch"
#define SPACING 10.0
@interface WishViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    BaseTableView *wishTableView;
}
@end

@implementation WishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProductData *prodData = [[ProductData alloc] init];
    [self showResponsesCollectionView];
    [prodData fetchDataFor:@"Clothing" withSuccess:^(NSMutableArray *data) {
        
        self.dataArray = data;
    } failure:^(NSError *error) {
        
    }];
    wishTableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 120, getScreenWidth(), getScreenHeight()-120-50) andProductsArray:nil];
    [self.view addSubview:wishTableView];
    [self.addNewWishBtn.layer setBorderColor:RGBA(217, 218, 216, 1).CGColor];
    [self.addNewWishBtn.layer setBorderWidth:1.0];
    [self.addNewWishBtn.layer setCornerRadius:5.0f];

    // Do any additional setup after loading the view.
}

-(void) adjustFrames{
    self.topSegmentControl.frame=CGRectMake((getScreenWidth()-139)*0.5, 78, 139, 29);
    self.addNewWishBtn.frame = CGRectMake(16, getOriginY(self.topSegmentControl)+getHeight(self.topSegmentControl)+14, getScreenWidth()-32, 30);
    int ycord = getOriginY(self.addNewWishBtn)+getHeight(self.addNewWishBtn)+14;
    self.responsesCollectionView.frame=CGRectMake(0, getOriginY(self.addNewWishBtn)+getHeight(self.addNewWishBtn)+14, getScreenWidth(), getScreenHeight()-ycord);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated{
    [self adjustFrames];
    [self doNecessaryActions];
    
}
- (IBAction)segmentValChanged:(id)sender {
    
    [self doNecessaryActions];
}

-(void) doNecessaryActions{
    
    if (self.topSegmentControl.selectedSegmentIndex==0) {
        self.addNewWishBtn.hidden=NO;
        self.responsesCollectionView.hidden=NO;
        wishTableView.hidden=YES;
    }
    else{
        self.addNewWishBtn.hidden=YES;
        self.responsesCollectionView.hidden=YES;
        ProductData *prodData = [[ProductData alloc] init];

        [prodData fetchFavoritesWithSuccess:^(NSMutableArray *data) {
            wishTableView.productArray=data;
            [wishTableView reloadData];
        } failure:^(NSError *error) {
            
        }];
        
        wishTableView.hidden=NO;
    }

    
}


- (IBAction)addNewWishBtn:(id)sender {
    
    AddWishViewController *wishCont = [[AddWishViewController alloc] initWithNibName:@"AddWishViewController" bundle:nil];
    [self.navigationController pushViewController:wishCont animated:YES];
    
}



#pragma mark UICollectionViewMethods


-(void) showResponsesCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    NSInteger width = (getScreenWidth()-3*SPACING)*0.5;
    layout.itemSize = CGSizeMake(width, width);
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumLineSpacing = SPACING;
    layout.minimumInteritemSpacing = SPACING;
    self.responsesCollectionView.collectionViewLayout=layout;
    self.responsesCollectionView.backgroundColor=RGBA(244, 245, 244, 1);
    [self.responsesCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    [cell bindDataFor:[self.dataArray objectAtIndex:indexPath.row]];
    cell.backgroundColor=RGBA(244, 245, 244, 1);
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(SPACING, SPACING, SPACING, SPACING);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
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
