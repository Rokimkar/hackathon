//
//  LeftDeckViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/11/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "LeftDeckViewController.h"
#import "LeftDeckTableViewCell.h"
#import "CategoryDetailViewController.h"
#import "SWRevealViewController.h"
@interface LeftDeckViewController (){
    NSArray *itemsArray ;
    CGSize screenSize;
}

@end

@implementation LeftDeckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize=([UIScreen mainScreen]).bounds.size;
    itemsArray = [[NSArray alloc]initWithObjects:@"Home",@"Electronics",@"Clothing",@"Books", nil];
    // Do any additional setup after loading the view.
    [self.itemListTableView registerNib:[UINib nibWithNibName:@"LeftDeckTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeftDeckTableViewCell"];
    self.itemListTableView.scrollEnabled=NO;
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryDetailViewController *controller = [[CategoryDetailViewController alloc] initWithSubCategoryArray:nil];
    controller.delegate=self;
    controller.view.backgroundColor = [UIColor greenColor];
    controller.menuBar.indicatorColor = [UIColor blueColor];
    UINavigationController *navCont = [[UINavigationController alloc] initWithRootViewController:controller];
    SWRevealViewController *revealCont = [self revealViewController];
    [revealCont setFrontViewController:navCont animated:YES];
    [revealCont setFrontViewPosition: FrontViewPositionLeft animated: YES];
//    revealCont.frontViewController.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
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
    item.title = [NSString stringWithFormat:@"Title %02ld", (long)(index+1)];
    
    // Customize appearance of menu bar item.
    UIButton* button = item.button;
    [button setTitleColor:[UIColor lightGrayColor]
                 forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor]
                 forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor blueColor]
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
