//
//  CategoryDetailViewController.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CategoryDetailViewController.h"
#import "SubcategorydetailViewController.h"
#import "ProductData.h"
@interface  CategoryDetailViewController()
{
    CGSize screenSize;
}
@end

@implementation CategoryDetailViewController

-(instancetype) initWithCategory:(NSString*)category andSubCategoryArray:(NSArray*) subCategoryArray{
    
    self =  [super init];
    if (self) {
        screenSize=([UIScreen mainScreen]).bounds.size;
        ProductData *prodData = [[ProductData alloc] init];
        NSMutableArray* viewControllers = [NSMutableArray array];
        for(int i = 0; i < subCategoryArray.count; i++){
            
            [prodData fetchDataFor:category andSubCategory:[subCategoryArray objectAtIndex:i] withSuccess:^(NSMutableArray *data) {
                SubcategorydetailViewController* vc = [[SubcategorydetailViewController alloc] initWithNibName:@"SubcategorydetailViewController" bundle:nil andDataArray:data];
                vc.view.frame = CGRectMake(0, 64, screenSize.width, screenSize.height-64);
                vc.subCategoryTitle = [subCategoryArray objectAtIndex:i];
                vc.view.backgroundColor = [UIColor colorWithWhite:0.3+0.05*i alpha:1.0];
                [viewControllers addObject:vc];
            } failure:^(NSError *error) {
            }];
        }
        
        [self setViewControllers:viewControllers];

        
        
    }
    
    return self;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}





@end
