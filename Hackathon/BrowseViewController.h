//
//  BrowseViewController.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/9/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseViewController : UIViewController
@property (strong,nonatomic) UICollectionView *topCollView;
@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic) NSMutableArray *collDataArray;

@end
