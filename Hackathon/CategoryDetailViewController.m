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
#import "SWRevealViewController.h"
#import "Prefix.pch"
@interface  CategoryDetailViewController()
{
    CGSize screenSize;
    UIButton *_leftBarButtonItem ;

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

-(void)viewDidLoad{
    
    [super viewDidLoad];

    self.menuBar.backgroundColor = RGBA(244, 245, 244, 1);
    self.view.backgroundColor = [UIColor clearColor];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem=[self getLeftMenuButton];
    self.view.backgroundColor = [UIColor clearColor];
    
}


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


- (UIBarButtonItem *) getLeftMenuButton{
    
    UIView *leftCotainerView = [[UIView alloc] initWithFrame:CGRectMake(0.0,0.0, 45.0f,44.0f)];
    _leftBarButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 39)];
    _leftBarButtonItem.showsTouchWhenHighlighted = FALSE;
    [_leftBarButtonItem addTarget:self action:@selector(leftBtnTapped) forControlEvents:UIControlEventTouchUpInside];
//    [_leftBarButtonItem setTitle:@"Button" forState:UIControlStateNormal];
//    [_leftBarButtonItem setTitle:@"Button" forState:UIControlStateHighlighted];
//    [_leftBarButtonItem setBackgroundColor:[UIColor redColor]];
    [_leftBarButtonItem setImage:[UIImage imageNamed:@"menuIcon.png"] forState:UIControlStateNormal];
    [_leftBarButtonItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [leftCotainerView addSubview:_leftBarButtonItem];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftCotainerView];
    
    
    return leftBarButtonItem;
}


- (SWRevealViewController*)revealViewController
{
    UIViewController *parent = self;
    Class revealClass = [SWRevealViewController class];
    
    while ( nil != (parent = [parent parentViewController]) && ![parent isKindOfClass:revealClass] )
    {
    }
    
    return (id)parent;
}

-(void)leftBtnTapped{
    SWRevealViewController *revealCont = [self revealViewController];
    [revealCont revealToggleAnimated:YES];

    
}

@end
