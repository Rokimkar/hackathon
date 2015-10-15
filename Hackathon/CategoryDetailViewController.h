//
//  CategoryDetailViewController.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMPScrollingMenuBarController.h"
@interface CategoryDetailViewController : RMPScrollingMenuBarController

-(instancetype) initWithCategory:(NSString*)category andSubCategoryArray:(NSArray*) subCategoryArray;

@end
