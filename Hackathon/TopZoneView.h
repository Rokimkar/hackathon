//
//  TopZoneView.h
//  demoPolling
//
//  Created by Kunal Chelani on 5/10/15.
//  Copyright (c) 2015 Kunal Chelani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface TopZoneView : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *topZoneCollectionView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (assign, nonatomic) NSInteger noOfItems;
@property (nonatomic,strong) NSArray* productsArray;
@property (nonatomic,strong) Product* product;
@property (assign, nonatomic) BOOL isWish;

-(id) initWithFrame: (CGRect)frame andItems: (NSArray*) productArray;
-(id) initWithFrame: (CGRect)frame andProduct:(Product*)product;

@end
