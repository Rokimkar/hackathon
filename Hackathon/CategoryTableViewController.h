//
//  CategoryTableViewController.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/16/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryViewControllerDelegate<NSObject>

-(void)dismissAfterSelectionWithSelectedString:(NSString*)category;

@end

@interface CategoryTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *itemListTableView;
@property (weak, nonatomic) id<CategoryViewControllerDelegate> delegate;

@end




