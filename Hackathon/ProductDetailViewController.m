//
//  ProductDetailViewController.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "TopZoneView.h"
#import "ProductDetailsTableViewCell.h"
#import "ProductDescriptionTableViewCell.h"
#import "Product.h"
#import "Prefix.pch"
#import "HackathonAppManager.h"
#import "WishViewController.h"
#import "WallViewController.h"
#import "AddWishViewController.h"
@interface ProductDetailViewController () <UITableViewDelegate,UITableViewDataSource>
{
    CGSize screenSize;
}
@end

@implementation ProductDetailViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProduct:(Product *)product{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.product=product;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize = ([[UIScreen mainScreen] bounds]).size;
    self.detailTableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self setBtnTitle];
}

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn setBackgroundImage:[UIImage imageNamed:@"Binoculars Filled-32.png"] forState:UIControlStateNormal];
    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"More Filled-32.png"] forState:UIControlStateNormal];
    UIBarButtonItem *moreActions = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"Shopping Cart-50.png"] forState:UIControlStateNormal];
    UIBarButtonItem *cart = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    //    navItems.rightBarButtonItems =
    self.navigationItem.rightBarButtonItems=[[NSArray alloc]initWithObjects:moreActions,searchBtn,cart, nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }
    else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    if (indexPath.section==0 && indexPath.row==0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        TopZoneView *topZoneView = [[TopZoneView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 172) andItems:imagesarr];
        TopZoneView *topZoneView = [[TopZoneView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 172) andProduct:self.product];
        [cell setBackgroundColor:[UIColor greenColor]];
        [cell addSubview:topZoneView];
    }
    else if (indexPath.section==0 && indexPath.row==1) {
        cell = (ProductDetailsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ProductDetailsTableViewCell"];
        if (cell==nil) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductDetailsTableViewCell" bundle:nil ] forCellReuseIdentifier:@"ProductDetailsTableViewCell"];
            NSArray *cellnib = [[NSBundle mainBundle] loadNibNamed:@"ProductDetailsTableViewCell" owner:self options:nil];
            cell = (ProductDetailsTableViewCell *)[cellnib objectAtIndex:0];
        }
        if ([self.buyBtnPressed.titleLabel.text isEqualToString:@"Respond"]) {
            ((ProductDetailsTableViewCell *)cell).isWish=YES;
        }
        else{
            ((ProductDetailsTableViewCell *)cell).isWish=NO;
        }
        
        
        [(ProductDetailsTableViewCell*)cell bindData:self.product];
    }
    else{
        cell = (ProductDescriptionTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ProductDescriptionTableViewCell"];
        if (cell==nil) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductDescriptionTableViewCell" bundle:nil ] forCellReuseIdentifier:@"ProductDescriptionTableViewCell"];
            NSArray *cellnib = [[NSBundle mainBundle] loadNibNamed:@"ProductDescriptionTableViewCell" owner:self options:nil];
            cell = (ProductDescriptionTableViewCell *)[cellnib objectAtIndex:0];
        }
        [(ProductDescriptionTableViewCell*)cell bindDataFor:self.product];
    }
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && indexPath.row==0)
        return 172;
    else if (indexPath.section==0 && indexPath.row==1)
        return 105;
    else if(indexPath.section==1)
        return [self heightForBasicCellAtIndexPath:indexPath];
    return 100;
}


- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
        static ProductDescriptionTableViewCell *sizingCell = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sizingCell = (ProductDescriptionTableViewCell*)[self.detailTableView dequeueReusableCellWithIdentifier:@"ProductDescriptionTableViewCell"];
            [self.detailTableView registerNib:[UINib nibWithNibName:@"ProductDescriptionTableViewCell" bundle:nil ] forCellReuseIdentifier:@"ProductDescriptionTableViewCell"];
            NSArray *cellnib = [[NSBundle mainBundle] loadNibNamed:@"ProductDescriptionTableViewCell" owner:self options:nil];
            sizingCell = (ProductDescriptionTableViewCell *)[cellnib objectAtIndex:0];
        });
    sizingCell.descLabel.text=self.product.prodDesc;
        return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsUpdateConstraints];
    [sizingCell updateConstraintsIfNeeded];
    
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
        UILabel *lbl =[[UILabel alloc] initWithFrame:CGRectMake(30, 0, screenSize.width, 44)];
        lbl.text=@"Description";
        lbl.textColor=[UIColor blackColor];
//        lbl.font=[UIFont fontWithName:@"SinkinSans-300Light" size:15];
        [view setBackgroundColor:RGBA(244, 245, 244, 1.0)];
        [view addSubview:lbl];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return 44;
    }
    else
        return 0;
}

- (IBAction)butBtnPressed:(id)sender {
    
    if ([self.buyBtnPressed.titleLabel.text isEqualToString:@"Respond"]) {
        AddWishViewController *vc = [[AddWishViewController alloc] initWithNibName:@"AddWishViewController" bundle:nil andDataArray:self.product];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"" message:@"Item added to cart." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
        
    
}


-(void) setBtnTitle{
    
    if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
//        UIViewController *vc = [self getViewController];
//        if ([self checkForViewController]) {
//            [self.buyBtnPressed setTitle:@"Respond" forState:UIControlStateNormal];
//            [self.buyBtnPressed setTitle:@"Respond" forState:UIControlStateHighlighted];
//        }
//        else{
//            [self.buyBtnPressed setTitle:@"Add to cart" forState:UIControlStateNormal];
//            [self.buyBtnPressed setTitle:@"Add to cart" forState:UIControlStateHighlighted];
//        }
        
        if (self.btnTitle && ![self.btnTitle isEqualToString:@""]) {
            [self.buyBtnPressed setTitle:self.btnTitle forState:UIControlStateNormal];
            [self.buyBtnPressed setTitle:self.btnTitle forState:UIControlStateHighlighted];
        }
        else{
            [self.buyBtnPressed setTitle:@"Add to cart" forState:UIControlStateNormal];
            [self.buyBtnPressed setTitle:@"Add to cart" forState:UIControlStateHighlighted];
        }
    }
    else{
        [self.buyBtnPressed setTitle:@"Add to cart" forState:UIControlStateNormal];
        [self.buyBtnPressed setTitle:@"Add to cart" forState:UIControlStateHighlighted];
    }
}


- (UIViewController *)getViewController {
    UIResponder *nextResponderView = [self nextResponder];
    while (![nextResponderView isKindOfClass:[WishViewController class]] || ![nextResponderView isKindOfClass:[WallViewController class]]) {
        nextResponderView = [nextResponderView nextResponder];
        if (nil == nextResponderView) {
            break;
        }
    }
    return (UIViewController *)nextResponderView;
}


-(BOOL) checkForViewController{
    
    UINavigationController *nv = self.navigationController;
    if (nv.viewControllers.count>=2) {
        UIViewController  *vc = [nv.viewControllers objectAtIndex:(nv.viewControllers.count-2)];
        if ([vc isKindOfClass:[WallViewController class]] || [vc isKindOfClass:[WishViewController class]]) {
            return YES;
        }
    }
    return NO;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
