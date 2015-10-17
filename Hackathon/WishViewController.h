//
//  WishViewController.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/9/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UISegmentedControl *topSegmentControl;
@property (weak, nonatomic) IBOutlet UIButton *addNewWishBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *responsesCollectionView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UIImageView *addIcon;

@end
