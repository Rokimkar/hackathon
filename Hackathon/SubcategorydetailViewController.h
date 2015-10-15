//
//  SubcategorydetailViewController.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubcategorydetailViewController : UIViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andDataArray:(NSMutableArray*)dataArray;

@property (nonatomic,strong) NSString *subCategoryTitle;
@property (nonatomic,strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end
