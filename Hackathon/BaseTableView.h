//
//  BaseTableView.h
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/13/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView
@property (strong,nonatomic) NSArray *productArray;
-(id) initWithFrame:(CGRect)frame andProductsArray:(NSArray*) prodSArray;

@end
