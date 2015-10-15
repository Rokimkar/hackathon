//
//  CategoryDetailViewController.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CategoryDetailViewController.h"
#import "SubcategorydetailViewController.h"
#import "SubCategoryViewController.h"
@interface  CategoryDetailViewController()
{
    CGSize screenSize;
}
@end

@implementation CategoryDetailViewController

-(instancetype) initWithSubCategoryArray:(NSArray*) subCategoryArray{
    
    self =  [super init];
    if (self) {
        screenSize=([UIScreen mainScreen]).bounds.size;
        NSMutableArray* viewControllers = [NSMutableArray array];
        for(int i = 0; i < 3; i++){
            NSMutableDictionary *subDict = [subCategoryArray objectAtIndex:i];
            SubcategorydetailViewController* vc = [[SubcategorydetailViewController alloc] initWithNibName:@"SubcategorydetailViewController" bundle:nil];
            vc.view.frame = CGRectMake(0, 64, screenSize.width, screenSize.height-64);
//            vc.subCategoryTitle = [subDict objectForKey:@"title"];
            vc.subCategoryTitle = [NSString stringWithFormat:@"%d",i];
            vc.dataArray = [subDict objectForKey:@"dataArray"];
            
            vc.view.backgroundColor = [UIColor colorWithWhite:0.3+0.05*i alpha:1.0];
            [viewControllers addObject:vc];
        }
        
        [self setViewControllers:viewControllers];
        
    }
    
    return self;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}





@end
