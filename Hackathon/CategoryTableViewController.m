//
//  CategoryTableViewController.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/16/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "LeftDeckTableViewCell.h"
#import "CategoryDetailViewController.h"
#import "SWRevealViewController.h"
#import "HackathonAppManager.h"
#import "ViewController.h"
#import "Prefix.pch"

@interface CategoryTableViewController ()
{
    NSArray *itemsArray ;
    CGSize screenSize;
    NSString *selectedCategory;
    NSArray *subCategoriesArray;

}
@end

@implementation CategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize=([UIScreen mainScreen]).bounds.size;
    itemsArray = [[NSArray alloc]initWithObjects:@"Electronics",@"Clothing",@"Books", nil];
    // Do any additional setup after loading the view.
    [self.itemListTableView registerNib:[UINib nibWithNibName:@"LeftDeckTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeftDeckTableViewCell"];
    self.itemListTableView.scrollEnabled=NO;
    self.itemListTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view setBackgroundColor:RGBA(246, 246, 246, 1)];
    [self.itemListTableView setBackgroundColor:RGBA(246, 246, 246, 1)];
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

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    
    return itemsArray.count;
}


-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    LeftDeckTableViewCell *cell= (LeftDeckTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"LeftDeckTableViewCell"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LeftDeckTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.labelForItems.text=[itemsArray objectAtIndex:indexPath.row];
    [cell.labelForItems setTextAlignment:NSTextAlignmentLeft];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.delegate dismissAfterSelectionWithSelectedString:[itemsArray objectAtIndex:indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView: (UITableView *)
tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - RMPScrollingMenuBarControllerDelegate methods
- (RMPScrollingMenuBarItem*)menuBarController:(RMPScrollingMenuBarController *)menuBarController
                           menuBarItemAtIndex:(NSInteger)index
{
    RMPScrollingMenuBarItem* item = [[RMPScrollingMenuBarItem alloc] init];
    if (index<subCategoriesArray.count) {
        item.title = [subCategoriesArray objectAtIndex:index];
    }
    // Customize appearance of menu bar item.
    UIButton* button = item.button;
    [button setTitleColor:[UIColor lightGrayColor]
                 forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor]
                 forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateSelected];
    return item;
}

- (void)menuBarController:(RMPScrollingMenuBarController *)menuBarController
 willSelectViewController:(UIViewController *)viewController
{
    //    NSLog(@"will select %@", viewController);
}

- (void)menuBarController:(RMPScrollingMenuBarController *)menuBarController
  didSelectViewController:(UIViewController *)viewController
{
    //    NSLog(@"did select %@", viewController);
}

- (void)menuBarController:(RMPScrollingMenuBarController *)menuBarController
  didCancelViewController:(UIViewController *)viewController
{
    //    NSLog(@"did cancel %@", viewController);
}

@end
